//
//  Rank.swift
//  CardImageKit
//
//  Created by William Hale on 10/7/14.
//  Copyright (c) 2014 William Hale. All rights reserved.
//

/// A rank for a playing card.
public struct Rank: Equatable, Hashable, CustomStringConvertible {

    /// The short name of the rank: A, 2, 3, ..., 9, T, J, Q, K.
    ///
    /// Note that ten has a short name of 'T'.
    public let name:String

    /// Creates a rank with the given name.
    /// - Parameter name: The short name of the rank.
    public init(_ name:String) {
        self.name = name
    }

    /// Indicates whether two ranks are equal.
    /// - Returns: A Boolean that’s set to true if the two ranks are equal.
    public static func == (lhs: Rank, rhs: Rank) -> Bool {
        lhs.name == rhs.name
    }

    /// Hashes the essential components of the rank by feeding them into the given hash function.
    /// - Parameter hasher: The hash function to use when combining the components of the rank.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    /// The short name of the rank: A, 2, 3, ..., 9, T, J, Q, K.
    ///
    /// Note that ten has a short name of 'T'.
    public var description: String { return name }

    /// The long name of the rank: ace, two, three, ..., nine, ten, jack, queen, king.
    public var longName:String {
        let longName:String
        switch self {
        case .ace: longName = "ace"
        case .two: longName = "two"
        case .three: longName = "three"
        case .four: longName = "four"
        case .five: longName = "five"
        case .six: longName = "six"
        case .seven: longName = "seven"
        case .eight: longName = "eight"
        case .nine: longName = "nine"
        case .ten: longName = "ten"
        case .jack: longName = "jack"
        case .queen: longName = "queen"
        case .king: longName = "king"
        default: longName = name
        }
        return longName
    }

    /// The true short name of the rank (using 10 rather than T).
    public var trueName:String { return self == .ten ? "10" : name }

    /// A Boolean value that determines whether the rank is an ace.
    public var isAce:Bool { return name == "A" }

    /// A Boolean value that determines whether the rank is a two.
    public var isTwo:Bool { return name == "2" }

    /// A Boolean value that determines whether the rank is a three.
    public var isThree:Bool { return name == "3" }

    /// A Boolean value that determines whether the rank is a four.
    public var isFour:Bool { return name == "4" }

    /// A Boolean value that determines whether the rank is a five.
    public var isFive:Bool { return name == "5" }

    /// A Boolean value that determines whether the rank is a six.
    public var isSix:Bool { return name == "6" }

    /// A Boolean value that determines whether the rank is a seven.
    public var isSeven:Bool { return name == "7" }

    /// A Boolean value that determines whether the rank is an eight.
    public var isEight:Bool { return name == "8" }

    /// A Boolean value that determines whether the rank is a nine.
    public var isNine:Bool { return name == "9" }

    /// A Boolean value that determines whether the rank is a ten.
    public var isTen:Bool { return name == "T" }

    /// A Boolean value that determines whether the rank is a jack.
    public var isJack:Bool { return name == "J" }

    /// A Boolean value that determines whether the rank is a queen.
    public var isQueen:Bool { return name == "Q" }

    /// A Boolean value that determines whether the rank is a king.
    public var isKing:Bool { return name == "K" }

    /// ace rank
    public static var ace:Rank { return Rank("A") }

    /// two rank
    public static var two:Rank { return Rank("2") }

    /// three rank
    public static var three:Rank { return Rank("3") }

    /// four rank
    public static var four:Rank { return Rank("4") }

    /// five rank
    public static var five:Rank { return Rank("5") }

    /// six rank
    public static var six:Rank { return Rank("6") }

    /// seven rank
    public static var seven:Rank { return Rank("7") }

    /// eight rank
    public static var eight:Rank { return Rank("8") }

    /// nine rank
    public static var nine:Rank { return Rank("9") }

    /// ten rank
    public static var ten:Rank { return Rank("T") }

    /// jack rank
    public static var jack:Rank { return Rank("J") }

    /// queen rank
    public static var queen:Rank { return Rank("Q") }

    /// king rank
    public static var king:Rank { return Rank("K") }

    /// A list of all the ranks from ace to king.
    public static let allRanks = [ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king]
}
