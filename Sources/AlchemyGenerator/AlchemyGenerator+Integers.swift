//
//  AlchemyGenerator+Integers.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 9/10/16.
//  Copyright © 2025 Sir Wellington. All rights reserved.
//

import Foundation

//======================================
// MARK: Integers
//======================================
public extension AlchemyGenerator {
    class Integers {
        public static var any: Int {
            AlchemyGenerator.anyInteger()
        }
        public static var positive: Int {
            AlchemyGenerator.positiveInteger()
        }
        public static var negative: Int {
            AlchemyGenerator.negativeInteger()
        }
    }
    
    ///
    /// Returns a random integer from `from`(inclusively) to `to`(inclusively)
    ///
    /// - parameter from: Must be `< to` (inclusive)
    /// - parameter to: Must be `> from` (inclusive)
    ///
    static func integer(
        fromInclusive from: Int,
        toInclusive to: Int
    ) -> Int {
        //Ensures `from` is less than `to`
        let `from` = min(from, to)
        let `to` = max(from, to)
        
        let difference = to - from
        let randomNumber = arc4random_uniform(UInt32(difference))
        let result = Int(randomNumber) + from
        
        return min(result, to)
    }
    
    ///
    /// Returns a random integer from `from`(inclusively) to `to`(exclusively)
    ///
    /// - parameter from: Must be `< to` (inclusive)
    /// - parameter to: Must be `> from` (exclusive)
    ///
    static func integer(
        fromInclusive from: Int,
        toExclusive to: Int
    ) -> Int {
        integer(
            fromInclusive: from,
            toInclusive: to-1
        )
    }
    
    static func positiveInteger() -> Int {
        return integer(
            fromInclusive: 1,
            toInclusive: 100_000
        )
    }
    
    static func negativeInteger() -> Int {
        return integer(
            fromInclusive: -100_000,
            toExclusive: 0
        )
    }
    
    static func anyInteger() -> Int {
        return integer(
            fromInclusive: -1_000_000,
            toInclusive: 1_000_000
        )
    }

    static func age() -> Int {
        return AlchemyGenerator.integer(
            fromInclusive: 18,
            toInclusive: 108
        )
    }

}
