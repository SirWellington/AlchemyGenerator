//
//  AlchemyIntGeneratorTests.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 9/10/16.
//  Copyright © 2016 Sir Wellington. All rights reserved.
//

import Foundation
@testable import AlchemyGenerator
import XCTest

class AlchemyIntGeneratorTests: XCTestCase
{
    
    override func setUp()
    {
        
    }
    
    func testRandomNumberWithPositive()
    {
        testRandomWith(min: 0, max: 100)
        testRandomWith(min: 10, max: 10_000)
        testRandomWith(min: 100, max: 100_000_000)
    }
    
    func testRandomNumberWithReversedParameters()
    {
        let from = 0
        let to = 1000
        
        let result = AlchemyGenerator.integer(from: to, to: from)
        verify(withMin: from, max: to, result: result)
    }
    
    func testRandomNumberWithNegative()
    {
        testRandomWith(min: -100, max: -1)
        testRandomWith(min: -100_000, max: 0)
        testRandomWith(min: -100, max: 100)
    }
    
    func testRandomNumberWithNegativeAndReversedParameters()
    {
        testRandomWith(min: -100, max: 0)
    }
    
    private func testRandomWith(min: Int, max: Int)
    {
        let result = AlchemyGenerator.integer(from: min, to: max)
        verify(withMin: min, max: max, result: result)
    }
    
    private func verify(withMin min: Int, max: Int, result: Int)
    {
        XCTAssertTrue(result >= min)
        XCTAssertTrue(result <= max)
    }
    
    func testPositiveIntegers()
    {
        let result = AlchemyGenerator.positiveInteger()
        XCTAssertTrue(result > 0)
    }
    
    func testNegativeIntegers()
    {
        let result = AlchemyGenerator.negativeInteger()
        XCTAssertTrue(result < 0)
    }
    
    func testAnyInteger()
    {
        let result = AlchemyGenerator.anyInteger()
        XCTAssertNotNil(result)
    }
}

//MARK: Test Integer Class
extension AlchemyIntGeneratorTests
{
    
    func testIntegersClass()
    {
        let negative = AlchemyGenerator.Integers.negative
        XCTAssertTrue(negative < 0)
        
        let positive = AlchemyGenerator.Integers.positive
        XCTAssertTrue(positive > 0)
        
        let any = AlchemyGenerator.Integers.any
        XCTAssertNotNil(any)
    }
}
