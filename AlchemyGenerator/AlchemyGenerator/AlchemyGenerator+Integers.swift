//
//  AlchemyGenerator+Integers.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 9/10/16.
//  Copyright © 2016 Sir Wellington. All rights reserved.
//

import Foundation


public extension AlchemyGenerator
{
    
    public class Integers
    {
        public static func any(from: Int, to: Int) -> Int
        {
            //Ensures `from` is less than `to`
            let `from` = from < to ? from : to
            let `to` = to > from ? to : from
            
            let difference = to - from
            
            let randomNumber = arc4random_uniform(UInt32(difference))
            
            let result = Int(randomNumber) + from
            
            return result < to ? result : to
        }
        
        public static func positiveInteger() -> Int
        {
            return any(from: 1, to: 100_000)
        }
        
        public static func negativeInteger() -> Int
        {
            return any(from: -100_000, to: -1)
        }
        
        public static func anyInteger() -> Int
        {
            return any(from: -1_000, to: 1_000)
        }
    }
    
    
}
