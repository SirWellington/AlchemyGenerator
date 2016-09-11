//
//  AlchemyGenerator+Strings.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 9/10/16.
//  Copyright © 2016 Sir Wellington. All rights reserved.
//

import Foundation

public extension AlchemyGenerator
{
    
    fileprivate static var defaultSize: Int
    {
        return AlchemyGenerator.integer(from: 5, to: 20)
    }
    
    public class Strings
    {
        
    }
    
    static func numericString(ofSize size: Int = defaultSize) -> String
    {
        guard size > 0 else { return "" }
        
        var result = ""
        
        for _ in (1...size)
        {
            let digit = AlchemyGenerator.integer(from: 0, to: 9)
            result += "\(digit)"
        }
        
        return result
    }
    
    static func alphabeticString(ofSize size: Int = defaultSize) -> String
    {
        guard size > 0 else { return "" }
        
        let alphabetics = Array(Characters.alphabetic)
        
        var result = ""
        for _ in (1...size)
        {
            let randomIndex = integer(from: 0, to: alphabetics.count - 1)
            let randomCharacter = alphabetics[randomIndex]
            result += "\(randomCharacter)"
        }
        
        return result
    }
    
    static func alphanumericString(ofSize size: Int = defaultSize) -> String
    {
        guard size > 0 else { return "" }
        
        let alphanumerics = Array(Characters.alphanumeric)
        
        var result = ""
        
        for _ in (1...size)
        {
            let randomIndex = integer(from: 0, to: alphanumerics.count - 1)
            let randomCharacter = alphanumerics[randomIndex]
            result += "\(randomCharacter)"
        }
        
        return result
    }
}

fileprivate class Characters
{
    static let alphabetic: Set<Character> =
    {
       let characters = "abcdefghijklmnopqrstuvwxyz"
        return Set(characters.characters)
    }()
    
    static let numeric: Set<Character> =
    {
        let digits = Set(0...9)
        
        let characters = digits.map() { Character("\($0)") }
        return Set(characters)
    }()
    
    static var alphanumeric: Set<Character>
    {
        let combined = alphabetic.union(numeric)
        return Set(combined)
    }
}
