import UIKit
import XCTest

@testable import CleanCodeAnimations
import SnapshotTesting

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
        assertSnapshot(matching: sut, as: .image(
            size: .init(width: 350, height: 667)),
            named: "MainView_state0"
        )
    }

    func testFailedInitialization() {
        XCTAssertNil(MainView(backgroundColors: [UIColor]()), "Should not create a MainView instance with an empty BG colors set")
        XCTAssertNil(MainView(backgroundColors: [UIColor.darkGray]), "Should not create a MainView instance unless there are at least 2 BG colors provided")
    }

    func testChangingBackground() {
        //  when:
        sut.changeBackgroundButton.simulateTap()

        //  then:
        XCTAssertEqual(sut.backgroundColor, fixtureSubsequentColor, "Should apply second color as a BG color")
        assertSnapshot(matching: sut, as: .image, named: "MainView_state1")

        //  when:
        sut.changeBackgroundButton.simulateTap()

        //  then:
        XCTAssertEqual(sut.backgroundColor, fixtureThirdColor, "Should apply third color as a BG color")
        assertSnapshot(matching: sut, as: .image(size: .init(width: 350, height: 667)), named: "MainView_state2")

        //  when:
        sut.changeBackgroundButton.simulateTap()

        //  then:
        XCTAssertEqual(sut.backgroundColor, fixtureInitialColor, "Should apply first color as a BG color")
        assertSnapshot(matching: sut, as: .image(size: .init(width: 350, height: 667)), named: "MainView_state3")
    }
}

extension UIView {

    func addToNewWindow(windowFrame: CGRect? = nil) {
        let frame = windowFrame ?? UIScreen.main.bounds
        self.bounds = frame
        let window = UIWindow(frame: frame)
        window.addSubview(self)
        window.makeKeyAndVisible()
    }
}
