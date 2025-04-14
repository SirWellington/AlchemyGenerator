//
//  AlchemyArrayGeneratorTests.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 9/11/16.
//  Copyright © 2025 Sir Wellington. All rights reserved.
//

import AlchemyGenerator
import AlchemyTest
import Foundation
import XCTest

final class AlchemyListGeneratorTests: AlchemyTest {
    var size = 0

    override func setUp() {
        super.setUp()
        size = AlchemyGenerator.integer(
            fromInclusive: 25,
            toInclusive: 200
        )
    }

    func testArrayOf() {
        repeatTest {
            let result = AlchemyGenerator.Arrays.of(
                size: size,
                AlchemyGenerator.anyInteger
            )
            XCTAssertTrue(result.count == size)
        }
    }

    func testArray() {
        repeatTest {
            let result = AlchemyGenerator.array(
                size: size
            ) {
                return AlchemyGenerator.hexString()
            }

            ensureNotEmpty(array: result)
            XCTAssertEqual(result.count, size)
        }
    }

    func testAnyElement() {
        repeatTest {
            let array = AlchemyGenerator.Arrays.ofAlphanumericString
            let element = AlchemyGenerator.anyOf(
                array
            )
            XCTAssertFalse(element == nil)
            XCTAssertTrue(array.contains(element!))
        }
    }
}

// MARK: Test Lists Class
extension AlchemyListGeneratorTests {
    func testArraysClass() {
        ensureNotEmpty(
            array: AlchemyGenerator.Arrays.ofAlphabeticString
        )
        ensureNotEmpty(
            array: AlchemyGenerator.Arrays.ofAlphanumericString
        )
        ensureNotEmpty(
            array: AlchemyGenerator.Arrays.ofString
        )
        ensureNotEmpty(
            array: AlchemyGenerator.Arrays.ofIntegers
        )
        ensureNotEmpty(
            array: AlchemyGenerator.Arrays.ofPositiveIntegers
        )
    }

    fileprivate func ensureNotEmpty<T>(
        array: [T]
    ) {
        XCTAssertFalse(array.isEmpty)
    }
}
