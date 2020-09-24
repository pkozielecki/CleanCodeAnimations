import UIKit
import FBSnapshotTestCase
@testable import CleanCodeAnimations

class MainViewSnapshotTests: FBSnapshotTestCase {
    var sut: MainView!

    override func setUp() {
        super.setUp()
        sut = MainView(
            backgroundColors: [.white, .yellow, .darkGray, .orange],
            animationsWrapper: FakeAnimationsWrapper.self
        )
    }

    func testInitialState() {
        FBSnapshotVerifyView(sut, identifier: "MainView_state0")
    }

    func testSubsequestStates() {
        //  when:
        sut.button.simulateTap()

        //  then:
        FBSnapshotVerifyView(sut, identifier: "MainView_state1")

        //  when:
        sut.button.simulateTap()

        //  then:
        FBSnapshotVerifyView(sut, identifier: "MainView_state2")

        //  when:
        sut.button.simulateTap()

        //  then:
        FBSnapshotVerifyView(sut, identifier: "MainView_state0")
    }
}
