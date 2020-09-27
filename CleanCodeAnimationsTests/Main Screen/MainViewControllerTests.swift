//
//  MainViewControllerTests.swift
//  CleanCodeAnimations
//

import UIKit
import XCTest
import SnapshotTesting
@testable import CleanCodeAnimations

final class MainViewControllerTest: XCTestCase {
    var sut: MainViewController!
    
    override func setUp() {
        sut = MainViewController(
            backgroundColors: [.white, .yellow, .orange],
            animationsWrapper: FakeAnimationsWrapper.self
        )
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
}
