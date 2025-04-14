//
//  AlchemyGeneratorDateTests.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 02/25/2018.
//  Copyright © 2025 SirWellington. All rights reserved.
//

@testable import AlchemyGenerator
import AlchemyTest
import Foundation
import XCTest

//======================================
// MARK: Date Tests
//======================================
final class AlchemyGeneratorDateTests: AlchemyTest {

    func testRightNow() {
        repeatTest {
            let now = Date()
            let result = AlchemyGenerator.rightNow()

            XCTAssertNotNil(result)
            XCTAssertEqual(
                result.timeIntervalSince1970,
                now.timeIntervalSince1970,
                accuracy: 1.0
            )
        }
    }

    func testFuture() {
        repeatTest {
            let now = Date()
            let result = AlchemyGenerator.futureDate()

            XCTAssertNotNil(result)
            XCTAssertTrue(
                result.timeIntervalSince1970 > now.timeIntervalSince1970
            )
        }
    }

    func testPast() {
        repeatTest {
            let now = Date()
            let result = AlchemyGenerator.pastDate()

            XCTAssertNotNil(result)
            XCTAssertTrue(
                result.timeIntervalSince1970 < now.timeIntervalSince1970
            )
        }
    }

    func testAny() {
        repeatTest {
            let result = AlchemyGenerator.anyDate()
            XCTAssertNotNil(result)
        }
    }

    func testDateClass() {
        repeatTest {
            let now = Date()
            let rightNow = AlchemyGenerator.Dates.now

            XCTAssertEqual(
                now.timeIntervalSince1970,
                rightNow.timeIntervalSince1970,
                accuracy: 1.0
            )

            let future = AlchemyGenerator.Dates.future
            XCTAssertTrue(
                future.timeIntervalSince1970 > now.timeIntervalSince1970
            )

            let past = AlchemyGenerator.Dates.past
            XCTAssertTrue(
                past.timeIntervalSince1970 < now.timeIntervalSince1970
            )

            let any = AlchemyGenerator.Dates.any
            XCTAssertNotNil(any)
        }
    }
}
