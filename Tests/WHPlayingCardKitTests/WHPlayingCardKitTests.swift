import XCTest
@testable import WHPlayingCardKit

final class WHPlayingCardKitTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let rank = Rank.eight
        let suit = Suit.diamonds
        let card = Card(rank: rank, suit: suit)
        XCTAssertEqual(card.rank, rank)
        XCTAssertEqual(card.suit, suit)
        XCTAssertEqual(card.packId, 0)
    }
}
