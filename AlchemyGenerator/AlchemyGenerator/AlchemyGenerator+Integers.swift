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
    
    static func integer(from: Int, to: Int) -> Int
    {
        //Ensures `from` is less than `to`
        let `from` = from < to ? from : to
        let `to` = to > from ? to : from
        
        let difference = to - from
        
        let randomNumber = arc4random_uniform(UInt32(difference))
        
        let result = Int(randomNumber) + from
        
        return result < to ? result : to
    }
}
