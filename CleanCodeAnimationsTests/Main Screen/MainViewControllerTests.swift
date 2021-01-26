//
//  MainViewControllerTests.swift
//  CleanCodeAnimations
//

import UIKit
import XCTest
import SnapshotTesting
import Mimus
@testable import CleanCodeAnimations

final class MainViewControllerTest: XCTestCase {
    let fixtureBackgroundColors: [UIColor] = [.white, .yellow, .orange]

    var fakeDelegate: FakeMainViewControllerDelegate!
    var sut: MainViewController!

    override func setUp() {
        fakeDelegate = FakeMainViewControllerDelegate()
        sut = MainViewController(
            backgroundColors: fixtureBackgroundColors,
            animationsWrapper: FakeAnimationsWrapper.self
        )
        sut.delegate = fakeDelegate
    }

    func testSnapshotsOnDifferentDevices() {
        assertSnapshot(
            matching: sut, as: .image(on: .iPhoneSe),
            named: "mainView_iphoneSe")
        assertSnapshot(
            matching: sut, as: .image(on: .iPhoneX),
            named: "mainView_iphoneX")
        assertSnapshot(
            matching: sut, as: .image(on: .iPhoneX(.landscape)),
            named: "mainView_iphoneX_landscape")
        assertSnapshot(
            matching: sut, as: .image(on: .iPhoneX(.landscape),
            precision: 0.95), named: "mainView_iphoneX_landscape_095")
        assertSnapshot(matching: sut, as: .recursiveDescription(on: .iPhoneX))
    }

    func testChangingBackgroundColor() {
        //  when - changing background color:
        sut.mainView.changeBackgroundButton.simulateTap()

        //  then:
        fakeDelegate.verifyCall(withIdentifier: "didChangeBackgroundColor", arguments: [fixtureBackgroundColors[1]])

        //  when - changing background color again:
        sut.mainView.changeBackgroundButton.simulateTap()

        //  then:
        fakeDelegate.verifyCall(withIdentifier: "didChangeBackgroundColor", arguments: [fixtureBackgroundColors[2]])
    }
    
    func testRequestingExit() {
        //  then:
        fakeDelegate.verifyCall(withIdentifier: "didRequestExitingCount", mode: .never)
        
        //  when - tapping exit button:
        sut.mainView.exitButton.simulateTap()

        //  then:
        fakeDelegate.verifyCall(withIdentifier: "didRequestExitingCount", arguments: [1])

        //  when - tapping exit button again:
        sut.mainView.exitButton.simulateTap()

        //  then:
        fakeDelegate.verifyCall(withIdentifier: "didRequestExitingCount", arguments: [2])
    }

    func testRequestingHelp() {
        //  when - tapping help button:
        sut.mainView.helpButton.simulateTap()

        //  then:
        fakeDelegate.verifyCall(withIdentifier: "didRequestHelpInitially", arguments: [true])

        //  when - tapping help button again:
        sut.mainView.helpButton.simulateTap()

        //  then:
        fakeDelegate.verifyCall(withIdentifier: "didRequestHelpInitially", arguments: [false])
    }
}

extension UIColor: MockEquatable {
    
    public func equalTo(other: Any?) -> Bool {
        if let otherUIColor = other as? UIColor {
            return otherUIColor == self
        }
        return false
    }
}
