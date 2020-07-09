import UIKit
import XCTest

@testable import CleanCodeAnimations

class MainViewTest: XCTestCase {

    let fixtureInitialColor = UIColor.white
    let fixtureSubsequentColor = UIColor.yellow
    let fixtureThirdColor = UIColor.orange
    var sut: MainView!

    override func setUp() {
        sut = MainView(
            backgroundColors: [fixtureInitialColor, fixtureSubsequentColor, fixtureThirdColor],
            animationsWrapper: FakeAnimationsWrapper.self
        )
    }

    func testInitialSetup() {
        XCTAssertEqual(sut.backgroundColors, [fixtureInitialColor, fixtureSubsequentColor, fixtureThirdColor], "Should use provided BG colors")
        XCTAssertEqual(sut.backgroundColor, fixtureInitialColor, "Should apply first provided color as a BG color")
    }

    func testFailedInitialization() {
        XCTAssertNil(MainView(backgroundColors: [UIColor]()), "Should not create a MainView instance with an empty BG colors set")
        XCTAssertNil(MainView(backgroundColors: [UIColor.darkGray]), "Should not create a MainView instance unless there are at least 2 BG colors provided")
    }

    func testChangingBackground() {
        //  when:
        sut.button.simulateTap()

        //  then:
        XCTAssertEqual(sut.backgroundColor, fixtureSubsequentColor, "Should apply second color as a BG color")

        //  when:
        sut.button.simulateTap()

        //  then:
        XCTAssertEqual(sut.backgroundColor, fixtureThirdColor, "Should apply third color as a BG color")

        //  when:
        sut.button.simulateTap()

        //  then:
        XCTAssertEqual(sut.backgroundColor, fixtureInitialColor, "Should apply first color as a BG color")
    }
}

