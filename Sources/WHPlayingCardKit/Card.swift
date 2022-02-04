//
//  Card.swift
//  CardImageKit
//
//  Created by William Hale on 9/30/14.
//  Copyright (c) 2014 William Hale. All rights reserved.
//

/// A playing card with a given rank, suit, and pack id.
public struct Card: Equatable, Hashable, CustomStringConvertible {

    /// The rank of the playing card.
    public let rank:Rank

    /// The suit of the playing card.
    public let suit:Suit

    /// The pack id of the playing card.
    ///
    /// The first pack id should be 0.
    /// Each additional pack of cards should increment the pack id by 1.
    ///
    /// The pack id allows you to have a deck consisting of multiple packs of cards in card games like canasta.
    public let packId:Int

    /// Creates a playing card with a given rank, suit, and pack id.
    /// - Parameters:
    ///   - rank: The rank of the playing card.
    ///   - suit: The suit of the playing card.
    ///   - packId: The pack id of the playing card.
    public init(rank:Rank, suit:Suit, packId:Int = 0) {
        self.rank = rank
        self.suit = suit
        self.packId = packId
    }

    /// A convenience method to create a playing card by its short name or pack name when prototyping, testing, or debugging.
    /// - Parameters:
    ///   - cardName: The (short) name or the pack name of the playing card.
    public init?(cardName:String) {
        let rankName = String(cardName.prefix(1))
        let suitName = String(cardName.prefix(2).suffix(1))
        let packId = Int(String(cardName.prefix(3).suffix(1))) ?? 0
        let rank = Rank(rankName)
        let suit = Suit(suitName)
        if Rank.allRanks.contains(rank), Suit.all4Suits.contains(suit) {
            self = Card(rank: rank, suit: suit, packId: packId)
        }
        else {
            return nil
        }
    }

    /// The short name of the playing card.
    ///
    /// For example, the queen of spades has the short name of "QS".
    ///
    /// Note that a card of rank ten has a "T" for its rank instead of "10".
    public var name: String { return rank.name + suit.name }

    /// The long name of the playing card.
    ///
    /// For example, the QS has the long name of "queen of spades".
    public var longName: String { return "\(rank.longName) of \(suit.longName)" }

    /// The unicode name for the playing card where the unicode suit symbol precedes the true rank name (using 10 instead of T) .
    public var unicodeName: String {
        return "\(suit.unicodeName)\(rank.trueName)"
    }

    /// The short name of the playing card followed by its packId when greater than 0.
    ///
    /// For example, the queen of spades of pack 2 has the short name of "QS1".
    ///
    /// Note that a card of rank ten has a "T" for its rank instead of "10".
    public var packName: String { return rank.name + suit.name + (packId == 0 ? "" : "\(packId)") }

    /// The short name of the playing card.
    ///
    /// For example, the queen of spades has the short name of "QS".
    ///
    /// Note that a card of rank ten has a "T" for its rank instead of "10".
    public var description: String { return name }
}
