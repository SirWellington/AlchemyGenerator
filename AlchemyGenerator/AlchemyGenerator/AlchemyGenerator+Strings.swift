//
//  AlchemyGenerator+Strings.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 9/10/16.
//  Copyright © 2016 Sir Wellington. All rights reserved.
//

import Foundation

//MARK: Strings Class
public extension AlchemyGenerator
{
    public class Strings
    {
        public static var alphabetic: String
        {
            return AlchemyGenerator.alphabeticString()
        }
        
        public static var alphanumeric: String
        {
            return AlchemyGenerator.alphanumericString()
        }
        
        public static var hex: String
        {
            return AlchemyGenerator.hexString()
        }
        
        public static var numeric: String
        {
            return AlchemyGenerator.numericString()
        }
    }
    
}

//MARK: String Generation Methods
public extension AlchemyGenerator
{
    
    fileprivate static var defaultSize: Int
    {
        return AlchemyGenerator.integer(from: 5, to: 20)
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

//MARK: Hex Strings
public extension AlchemyGenerator
{
    
    static func hexString(ofSize size: Int = defaultSize) -> String
    {
        guard size > 0 else { return "" }
        
        let hexCharacters = Characters.hex
        let result = createString(fromCharacterSet: hexCharacters, ofSize: size)
        
        return result
    }
}


//MARK: String Creation Methods
fileprivate extension AlchemyGenerator
{
    static func createString(fromCharacterSet set: Set<Character>, ofSize size: Int) -> String
    {
        guard size > 0 else { return "" }
        
        let characters = Array(set)
        
        var result = ""
        
        for _ in (1...size)
        {
            let randomIndex = integer(from: 0, to: characters.count - 1)
            let randomCharacter = characters[randomIndex]
            result += "\(randomCharacter)"
        }
        
        return result
    }
}

//MARK: Character Sets
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
    
    static let hex: Set<Character> =
    {
        let characters = "0123456789ABCDEF"
        return Set(characters.characters)
    }()
}
