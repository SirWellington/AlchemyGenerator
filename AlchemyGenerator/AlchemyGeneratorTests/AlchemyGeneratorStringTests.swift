//
//  AlchemyGeneratorStringTests.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 9/10/16.
//  Copyright © 2016 Sir Wellington. All rights reserved.
//

import AlchemyGenerator
import Foundation
import XCTest

class AlchemyStringGeneratorTests: XCTestCase
{
    private var size: Int = 0
    
    override func setUp()
    {
        size = AlchemyGenerator.integer(from: 10, to: 100)
    }
    
    func testNumericString()
    {
        let string = AlchemyGenerator.numericString(ofSize: size)
        XCTAssertEqual(string.characters.count, size)
    }
}
