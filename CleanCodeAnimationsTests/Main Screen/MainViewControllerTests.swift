//
//  MainViewControllerTests.swift
//  CleanCodeAnimations
//

import UIKit
import XCTest
import SnapshotTesting
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
        XCTAssertEqual(fakeDelegate.lastSetBackgroundColor, fixtureBackgroundColors[1], "Should return proper background color in delegate")

        //  when - changing background color again:
        sut.mainView.changeBackgroundButton.simulateTap()

        //  then:
        XCTAssertEqual(fakeDelegate.lastSetBackgroundColor, fixtureBackgroundColors[2], "Should return proper background color in delegate")
    }

    func testRequestingExit() {
        //  when - tapping exit button:
        sut.mainView.exitButton.simulateTap()

        //  then:
        XCTAssertEqual(fakeDelegate.lastSetExitRequestCount, 1, "Should return proper exit request count in delegate")

        //  when - tapping exit button again:
        sut.mainView.exitButton.simulateTap()

        //  then:
        XCTAssertEqual(fakeDelegate.lastSetExitRequestCount, 2, "Should return proper exit request count in delegate")
    }

    func testRequestingHelp() {
        //  when - tapping help button:
        sut.mainView.helpButton.simulateTap()

        //  then:
        XCTAssertEqual(fakeDelegate.lastSetDidRequestHelpInitially, true, "Should return initial help request in delegate")

        //  when - tapping help button again:
        sut.mainView.helpButton.simulateTap()

        //  then:
        XCTAssertEqual(fakeDelegate.lastSetDidRequestHelpInitially, false, "Should return non-initial help request in delegate")
    }
}
