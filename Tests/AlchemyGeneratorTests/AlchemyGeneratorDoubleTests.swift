//
//  AlchemyGenerator+DoubleTests.swift
//  AlchemyGeneratorTests
//
//  Created by Wellington Moreno on 11/10/17.
//  Copyright © 2019 SirWellington. All rights reserved.
//

import AlchemyGenerator
import Foundation
import XCTest

class AlchemyGeneratorPlusDoublesTests: XCTestCase
{
    
    func testRandomWithPositive()
    {
        testRandomWith(min: 0, max: 1000)
        testRandomWith(min: 139, max: 129342)
        testRandomWith(min: 100, max: 10_000_000.0)
    }
    
    func testRandomWithNegative()
    {
        testRandomWith(min: -10, max: 0)
        testRandomWith(min: -100, max: -10)
        testRandomWith(min: -100_000, max: -1)
    }
    
    func testRandomWithNegativeMinAndPositiveMax()
    {
        testRandomWith(min: -100, max: 100)
        testRandomWith(min: -1, max: 1)
    }
    
    func testRandomWithInversedParameters()
    {
        let min = 10.0
        let max = 100.0
        let result = AlchemyGenerator.doubles(fromInclusive: max, toInclusive: min)
        verify(withMin: min, max: max, result: result)
    }
    
    func testPositiveDouble()
    {
        let result = AlchemyGenerator.positiveDouble()
        XCTAssertTrue(result > 0.0)
    }
    
    func testNegativeDouble()
    {
        let result = AlchemyGenerator.negativeDouble()
        XCTAssertTrue(result < 0.0)
    }
    
    func testAnyDouble()
    {
        let result = AlchemyGenerator.anyDouble()
        XCTAssertNotNil(result)
    }
    
    private func testRandomWith(min: Double, max: Double)
    {
        let result = AlchemyGenerator.doubles(fromInclusive: min, toInclusive: max)
        verify(withMin: min, max: max, result: result)
    }
    
    private func verify(withMin min: Double, max: Double, result: Double)
    {
        XCTAssertTrue(result >= min)
        XCTAssertTrue(result <= max)
    }
}

class DoubleClassesTests: XCTestCase
{
    func testAny()
    {
        let any = AlchemyGenerator.Doubles.any
        XCTAssertNotNil(any)
    }
    
    func testPositive()
    {
        let result = AlchemyGenerator.Doubles.positive
        XCTAssertTrue(result > 0.0)
    }
    
    func testNegative()
    {
        let result = AlchemyGenerator.Doubles.negative
        XCTAssertTrue(result < 0.0)
    }
}
