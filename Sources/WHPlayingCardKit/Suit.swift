//
//  Suit.swift
//  WHPlayingCardKit
//
//  Created by William Hale on 10/7/14.
//

import SpriteKit

/// A suit for a playing card.
public struct Suit: Equatable, Hashable, CustomStringConvertible {

    /// The short name of the suit: C, D, H, or S.
    public let name:String

    /// Creates a suit with the given name.
    /// - Parameter name: The short name of the suit.
    public init(_ name:String) {
        self.name = name
    }

    /// Indicates whether two suits are equal.
    /// - Returns: A Boolean that’s set to true if the two suits are equal.
    public static func == (lhs: Suit, rhs: Suit) -> Bool {
        lhs.name == rhs.name
    }

    /// Hashes the essential components of the suit by feeding them into the given hash function.
    /// - Parameter hasher: The hash function to use when combining the components of the suit.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    /// The short name of the suit: C, D, H, or S.
    public var description: String { return name }

    /// The long name of the suit: clubs, diamonds, hearts, or spades.
    public var longName:String {
        var longName = name
        if self.isClubs {
            longName = "clubs"
        }
        else if self.isDiamonds {
            longName = "diamonds"
        }
        else if self.isHearts {
            longName = "hearts"
        }
        else if self.isSpades {
            longName = "spades"
        }
        return longName
    }

    /// The unicode symbol for the suit.
    public var unicodeName:String {
        // 220127 FIXME: also need option for white heart U+2661 and white diamond U+2662
        // 220127 FIXME: also need option for image variant vs text variant
        // 220127 FIXME: need to make function rather than var
        let unicodeName:String
        let unicode_variant = "\u{FE0F}" // text variant is "\u{FE0E}"; image variant is "\u{FE0F}"
        if self.isClubs {
            unicodeName = "\u{2663}{\(unicode_variant)"
        }
        else if self.isDiamonds {
            unicodeName = "\u{2666}\(unicode_variant)"
        }
        else if self.isHearts {
            unicodeName = "\u{2665}\(unicode_variant)"
        }
        else if self.isSpades {
            unicodeName = "\u{2660}\(unicode_variant)"
        }
        else {
            unicodeName = name
        }
        return unicodeName
    }

    /// The color of the suit: red for diamonds and hearts; black for clubs and spades.
    public var color: SKColor { return self.isDiamonds || self.isHearts ? Suit.redColor : SKColor.black }

    /// A Boolean value that determines whether the suit is clubs.
    public var isClubs:Bool { return name == "C" }

    /// A Boolean value that determines whether the suit is diamonds.
    public var isDiamonds:Bool { return name == "D" }

    /// A Boolean value that determines whether the suit is hearts.
    public var isHearts:Bool { return name == "H" }

    /// A Boolean value that determines whether the suit is spades.
    public var isSpades:Bool { return name == "S" }

    /// club suit
    public static var clubs:Suit { return Suit("C") }

    /// diamond suit
    public static var diamonds:Suit { return Suit("D") }

    /// heart suit
    public static var hearts:Suit { return Suit("H") }

    /// spade suit
    public static var spades:Suit { return Suit("S") }

    /// A list of all the suits from clubs to spades in bridge order.
    public static let all4Suits:[Suit] = [clubs, diamonds, hearts, spades]

    public static let redColor = SKColor(red: 223 / 255, green: 0 / 255, blue: 3 / 255, alpha: 1)
}
