//
//  AlchemyGenerator+Doubles.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 11/10/17.
//  Copyright © 2017 SirWellington. All rights reserved.
//

import Foundation

public extension AlchemyGenerator
{
    
    public class Doubles
    {
        public static var any: Double { return AlchemyGenerator.anyDouble() }
        
        public static var positive: Double { return AlchemyGenerator.positiveDouble() }
        
        public static var negative: Double { return AlchemyGenerator.negativeDouble() }
    }
    
    public static func doubles(fromInclusive from: Double, toInclusive to: Double) -> Double
    {
        //Ensure 'from' is less than 'to'
        let `from` = from < to ? from : to
        let `to` = to > from ? to : from
        
        let difference = to - from
        let differentExpanded = difference * 100
        
        let deltaExpanded = arc4random_uniform(UInt32(differentExpanded))
        let deltaContracted = Double(deltaExpanded) / 100.0
        let result = from + deltaContracted
        
        return result < to ? result : to
    }
    
    public static func positiveDouble() -> Double
    {
        return doubles(fromInclusive: 0.1, toInclusive: 1_000.0)
    }
    
    public static func negativeDouble() -> Double
    {
        return doubles(fromInclusive: -1000.0, toInclusive: -0.1)
    }
    
    public static func anyDouble() -> Double
    {
        return doubles(fromInclusive: -10_000.0, toInclusive: 10_000.0)
    }
}
