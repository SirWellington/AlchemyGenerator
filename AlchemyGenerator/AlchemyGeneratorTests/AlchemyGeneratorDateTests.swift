//
//  AlchemyGeneratorDateTests.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 02/25/2018.
//  Copyright © 2018 SirWellington. All rights reserved.
//

@testable
import AlchemyGenerator
import Foundation
import XCTest

//======================================
// MARK: Date Tests
//======================================
class AlchemyGeneratorDateTests: XCTestCase
{
    private let iterations = 100

    func testRightNow()
    {
        (0...iterations).forEach
        { _ in

            let now = Date()
            let result = AlchemyGenerator.rightNow()

            XCTAssertTrue(result != nil)
            XCTAssertEqualWithAccuracy(result.timeIntervalSince1970, now.timeIntervalSince1970, accuracy: 1.0)
        }
    }

    func testFuture()
    {
        (0...iterations).forEach
        { _ in

            let now = Date()
            let result = AlchemyGenerator.futureDate()

            XCTAssertTrue(result != nil)
            XCTAssertTrue(result.timeIntervalSince1970 > now.timeIntervalSince1970)
        }
    }

    func testPast()
    {
        (0...iterations).forEach
        { _ in

            let now = Date()
            let result = AlchemyGenerator.pastDate()

            XCTAssertTrue(result != nil)
            XCTAssertTrue(result.timeIntervalSince1970 < now.timeIntervalSince1970)
        }
    }

    func testDateClass()
    {
        (0...iterations).forEach
        { _ in

            let now = Date()
            var rightNow = AlchemyGenerator.Dates.now

            XCTAssertEqualWithAccuracy(now.timeIntervalSince1970, rightNow.timeIntervalSince1970, accuracy: 1.0)

            let future = AlchemyGenerator.Dates.future
            XCTAssertTrue(future.timeIntervalSince1970 > now.timeIntervalSince1970)

            let past = AlchemyGenerator.Dates.past
            XCTAssertTrue(past.timeIntervalSince1970 < now.timeIntervalSince1970)
        }
    }

}