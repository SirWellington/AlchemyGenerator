//
//  AlchemyBooleanGeneratorTests.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 07/27/2018.
//  Copyright © 2025 SirWellington. All rights reserved.
//

@testable import AlchemyGenerator
import AlchemyTest
import Foundation
import XCTest

//======================================
// MARK: ALCHEMY BOOLEAN TESTS
//======================================
final class AlchemyBooleanGeneratorTests: AlchemyTest {
    
    func testAnyBoolean() {
        repeatTest {
            let set = NSMutableSet()
            
            for _ in 1...iterations {
                let boolean = AlchemyGenerator.boolean()
                XCTAssertNotNil(boolean)
                
                set.add(boolean)
            }
            
            XCTAssertEqual(set.count, 2)
        }
    }
}
