//
//  AlchemyBooleanGeneratorTests.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 07/27/2018.
//  Copyright © 2019 SirWellington. All rights reserved.
//

@testable import AlchemyGenerator
import Foundation
import XCTest


//======================================
// MARK: ALCHEMY BOOLEAN TESTS
//======================================
class AlchemyBooleanGeneratorTests: XCTestCase
{
    var iterations = 100


    func testAnyBoolean()
    {
        let set = NSMutableSet()
        
        for _ in (1...iterations)
        {
            let boolean = AlchemyGenerator.boolean()
            XCTAssertNotNil(boolean)
            
            set.add(boolean)
        }
        
        XCTAssert(set.count == 2)
    }

}
