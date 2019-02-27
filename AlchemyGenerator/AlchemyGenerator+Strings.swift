//
//  AlchemyGenerator+Strings.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 9/10/16.
//  Copyright © 2018 Sir Wellington. All rights reserved.
//

import Foundation


//======================================
// MARK: STRINGS CLASS
//======================================
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

        public static var email: String
        {
            return AlchemyGenerator.email()
        }
        
        public static var hex: String
        {
            return AlchemyGenerator.hexString()
        }

        public static var phone: String
        {
            return AlchemyGenerator.phoneNumber()
        }

        public static var name: String
        {
            return AlchemyGenerator.name()
        }
        
        public static var numeric: String
        {
            return AlchemyGenerator.numericString()
        }

        public static var url: String
        {
           return AlchemyGenerator.url()
        }
    }
    
}


//======================================
// MARK: STRING GENERATORS
//======================================
public extension AlchemyGenerator
{
    
    static var defaultStringSize: Int
    {
        return Int.random(in: 5...20)
    }
    
    static func numericString(ofSize size: Int = defaultStringSize) -> String
    {
        guard size > 0 else { return "" }
        
        let numeric = Characters.numeric
        let result = createString(fromCharacterSet: numeric, ofSize: size)
        
        return result
    }
    
    static func alphabeticString(ofSize size: Int = defaultStringSize) -> String
    {
        guard size > 0 else { return "" }
        
        let alphabetic = Characters.alphabetic
        let result = createString(fromCharacterSet: alphabetic, ofSize: size)
        return result
    }
    
    static func alphanumericString(ofSize size: Int = defaultStringSize) -> String
    {
        guard size > 0 else { return "" }
        
        let alphanumeric = Characters.alphanumeric
        let result = createString(fromCharacterSet: alphanumeric, ofSize: size)
        
        return result
    }

}

//MARK: Hex Strings
public extension AlchemyGenerator
{
    
    static func hexString(ofSize size: Int = defaultStringSize) -> String
    {
        guard size > 0 else { return "" }
        
        let hexCharacters = Characters.hex
        let result = createString(fromCharacterSet: hexCharacters, ofSize: size)
        
        return result
    }
}

//MARK: UUID Creation
public extension AlchemyGenerator
{
    static func uuidString() -> String
    {
        let uuid = UUID.init()
        return uuid.uuidString
    }
}

//MARK: Characters From Set
public extension AlchemyGenerator
{
    static func stringFromList(_ list: [String]) -> String
    {
        guard !list.isEmpty else { return "" }
        
        let randomIndex = integer(from: 0, to: list.count - 1)
        return list[randomIndex]
    }
}


//======================================
// MARK: URL
//======================================
public extension AlchemyGenerator
{

    static func domain() -> String
    {
        let domains = ["com", "net", "tech", "love", "co", "do"]
        return stringFromList(domains)
    }

    static func url() -> String
    {
        let hostname = Strings.alphabetic
        let domain = AlchemyGenerator.domain()
        let suffix = Strings.alphanumeric

        let url = "https://\(hostname).\(domain)/\(suffix)"
        return url
    }
}


//======================================
// MARK: PEOPLE
//======================================
public extension AlchemyGenerator
{

    static func name() -> String
    {
        return stringFromList(Resources.names)
    }

    static func phoneNumber() -> String
    {
        let country = integer(from: 1, to: 80)
        let area = integer(from: 100, to: 999)
        let first = integer(from: 100, to: 999)
        let second = integer(from: 1000, to: 9999)
        return "\(country)-\(area)-\(first)-\(second)"
    }

    static func email() -> String
    {
        let username1 = name().lowercased()
        let username2 = numericString(ofSize: Int.random(in: 2...4))
        let emailDomains = ["gmail.com", "alchemy.tech", "yahoo.com", "googlemail.com", "hotmail.com", "icloud.com"]
        let domain = stringFromList(emailDomains)

        return "\(username1).\(username2)@\(domain)"
    }

}


//======================================
// MARK: PRIVATE METHODS
//======================================

private extension AlchemyGenerator
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
private class Characters
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
