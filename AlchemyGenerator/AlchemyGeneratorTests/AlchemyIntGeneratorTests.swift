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
        var from = 0
        var to = 100
        
        var result = AlchemyGenerator.Integers.any(from: from, to: to)
        verify(withMin: from, max: to, result: result)
        
        from = 10
        to = 10_000
        result = AlchemyGenerator.Integers.any(from: from, to: to)
        verify(withMin: from, max: to, result: result)
        
        from = 100
        to = 100_000_000
        result = AlchemyGenerator.Integers.any(from: from, to: to)
        verify(withMin: from, max: to, result: result)
    }
    
    func testRandomNumberWithReversedParameters()
    {
        let from = 0
        let to = 1000
        
        let result = AlchemyGenerator.Integers.any(from: to, to: from)
        verify(withMin: from, max: to, result: result)
    }
    
    func testRandomNumberWithNegative()
    {
        var from = -100
        var to = -1
        var result = AlchemyGenerator.Integers.any(from: from, to: to)
        verify(withMin: from, max: to, result: result)
        
        from = -100_000
        to = 0
        result = AlchemyGenerator.Integers.any(from: from, to: to)
        verify(withMin: from, max: to, result: result)
        
        from = -100
        to = 100
        result = AlchemyGenerator.Integers.any(from: from, to: to)
    }
    
    func testRandomNumberWithNegativeAndReversedParameters()
    {
        let from = -100
        let to = 0
        let result = AlchemyGenerator.Integers.any(from: to, to: from)
        verify(withMin: from, max: to, result: result)
    }
    
    private func verify(withMin min: Int, max: Int, result: Int)
    {
        XCTAssertTrue(result >= min)
        XCTAssertTrue(result <= max)
    }
    
    func testPositiveIntegers()
    {
        let result = AlchemyGenerator.Integers.positiveInteger()
        XCTAssertTrue(result > 0)
    }
    
    func testNegativeIntegers()
    {
        let result = AlchemyGenerator.Integers.negativeInteger()
        XCTAssertTrue(result < 0)
    }
    
    func testAnyInteger()
    {
        let result = AlchemyGenerator.Integers.anyInteger()
        XCTAssertNotNil(result)
    }
}
