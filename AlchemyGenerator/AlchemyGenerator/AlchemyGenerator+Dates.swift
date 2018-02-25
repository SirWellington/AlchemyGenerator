//
//  AlchemyGenerator+Dates.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 02/25/2018.
//  Copyright © 2018 SirWellington. All rights reserved.
//

import Foundation


//======================================
// MARK: Generated Dates
//======================================

public extension AlchemyGenerator
{
    private static var calendar: Calendar { return .autoupdatingCurrent }
  
    static func rightNow() -> Date
    {
        return Date()
    }

    static func pastDate() -> Date
    {
        let now = rightNow()
        let hoursAgo = integer(from: 1, to: 10_000)

        return calendar.date(byAdding: .hour, value: -hoursAgo, to: now) ??
                now.addingTimeInterval(Double(-hoursAgo) * 60.0)
    }

    static func futureDate() -> Date
    {
        let now = rightNow()
        let hoursAhead = integer(from: 1, to: 10_000)

        return calendar.date(byAdding: .hour, value: hoursAhead, to: now) ??
                now.addingTimeInterval(Double(hoursAhead) * 60)
    }

    static func anyDate() -> Date
    {
       let branch = AlchemyGenerator.integer(from: 0, to: 3)

        switch branch
        {
            case 0 : return rightNow()
            case 1 : return pastDate()
            case 2: return futureDate()
            default : return rightNow()
        }
    }

    public class Dates
    {
        static var now: Date { return AlchemyGenerator.rightNow() }

        static var past: Date { return AlchemyGenerator.pastDate() }

        static var future: Date { return AlchemyGenerator.futureDate() }

        static var any: Date { return AlchemyGenerator.anyDate() }
    }
}
