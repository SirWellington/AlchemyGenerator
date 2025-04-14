//
//  AlchemyGenerator+Dates.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 02/25/2018.
//  Copyright © 2025 SirWellington. All rights reserved.
//

import Foundation


//======================================
// MARK: Generated Dates
//======================================

public extension AlchemyGenerator {
    private static var calendar: Calendar { return .autoupdatingCurrent }
  
    static func rightNow() -> Date {
        return Date()
    }

    static func pastDate() -> Date {
        let now = rightNow()
        let hoursAgo = integer(
            fromInclusive: 1,
            toInclusive: 10_000
        )

        return calendar.date(
            byAdding: .hour,
            value: -hoursAgo,
            to: now
        ) ?? now.addingTimeInterval(Double(-hoursAgo) * 60.0)
    }

    static func futureDate() -> Date
    {
        let now = rightNow()
        let hoursAhead = integer(
            fromInclusive: 1,
            toInclusive: 10_000
        )

        return calendar.date(
            byAdding: .hour,
            value: hoursAhead,
            to: now
        ) ?? now.addingTimeInterval(Double(hoursAhead) * 60)
    }

    static func anyDate() -> Date {
       let branch = AlchemyGenerator.integer(
        fromInclusive: 0,
        toInclusive: 3
       )

        switch branch {
            case 0 : return rightNow()
            case 1 : return pastDate()
            case 2: return futureDate()
            default : return rightNow()
        }
    }

    class Dates {
        public static var any: Date { AlchemyGenerator.anyDate() }
        public static var future: Date { AlchemyGenerator.futureDate() }
        public static var now: Date { AlchemyGenerator.rightNow() }
        public static var past: Date { AlchemyGenerator.pastDate() }
    }

}
