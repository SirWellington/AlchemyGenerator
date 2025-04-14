//
//  AlchemyGenerator+Strings.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 9/10/16.
//  Copyright © 2019 Sir Wellington. All rights reserved.
//

import Foundation


//======================================
// MARK: Strings
//======================================
public extension AlchemyGenerator {

    class Strings {
        static var alphabetic: String { AlchemyGenerator.alphabeticString() }
        static var alphanumeric: String { AlchemyGenerator.alphanumericString() }
        static var email: String { AlchemyGenerator.email() }
        static var hex: String { AlchemyGenerator.hexString() }
        static var phone: String { AlchemyGenerator.phoneNumber() }
        static var name: String { AlchemyGenerator.name() }
        static var numeric: String { AlchemyGenerator.numericString() }
        static var url: String { AlchemyGenerator.url() }
    }
    
}


//======================================
// MARK: STRING GENERATORS
//======================================
public extension AlchemyGenerator {
    
    static var defaultStringSize: Int {
        return Int.random(in: 5...20)
    }
    
    static func numericString(size: Int = defaultStringSize) -> String {
        guard size > 0 else { return "" }
        
        let numeric = Characters.numeric
        let result = createString(
            characterSet: numeric,
            size: size
        )
        
        return result
    }
    
    static func alphabeticString(size: Int = defaultStringSize) -> String {
        guard size > 0 else { return "" }
        
        let alphabetic = Characters.alphabetic
        let result = createString(
            characterSet: alphabetic,
            size: size
        )
        return result
    }
    
    static func alphanumericString(
        ofSize size: Int = defaultStringSize
    ) -> String {
        guard size > 0 else { return "" }
        
        let alphanumeric = Characters.alphanumeric
        let result = createString(
            characterSet: alphanumeric,
            size: size
        )
        
        return result
    }

}

//MARK: Hex Strings
public extension AlchemyGenerator {
    
    static func hexString(ofSize size: Int = defaultStringSize) -> String {
        guard size > 0 else { return "" }
        
        let hexCharacters = Characters.hex
        let result = createString(
            characterSet: hexCharacters,
            size: size
        )
        
        return result
    }
}

//MARK: UUID Creation
public extension AlchemyGenerator {
    static func uuidString() -> String {
        let uuid = UUID.init()
        return uuid.uuidString
    }
}

//MARK: Characters From Set
public extension AlchemyGenerator {
    static func stringFromList(_ list: [String]) -> String {
        guard !list.isEmpty else { return "" }
        
        let randomIndex = integer(from: 0, to: list.count - 1)
        return list[randomIndex]
    }
}


//======================================
// MARK: URL
//======================================
public extension AlchemyGenerator {
    
    static func domain() -> String {
        let domains = [
            "com",
            "net",
            "tech",
            "love",
            "co",
            "do",
            "realtor",
            "vegas"
        ]
        return stringFromList(domains)
    }

    static func url() -> String {
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
public extension AlchemyGenerator {

    static func name() -> String {
        return stringFromList(Resources.names)
    }

    static func phoneNumber() -> String {
        let country = integer(from: 1, to: 80)
        let area = integer(from: 100, to: 999)
        let first = integer(from: 100, to: 999)
        let second = integer(from: 1000, to: 9999)
        return "\(country)-\(area)-\(first)-\(second)"
    }

    static func email() -> String {
        let username1 = name().lowercased()
        let username2 = numericString(
            size: integer(from: 2, to: 4)
        )
        let emailDomains = [
            "gmail.com",
            "alchemy.tech",
            "yahoo.com",
            "googlemail.com",
            "hotmail.com",
            "icloud.com",
            "kw.com"
        ]
        let domain = stringFromList(emailDomains)

        return "\(username1).\(username2)@\(domain)"
    }

}


//======================================
// MARK: PRIVATE METHODS
//======================================

private extension AlchemyGenerator {
    static func createString(
        characterSet : Set<Character>,
        size: Int
    ) -> String {
        guard size > 0 else { return "" }
        
        let characters = Array(characterSet)
        
        var result = ""
        
        for _ in (1...size) {
            let randomIndex = integer(from: 0, to: characters.count - 1)
            let randomCharacter = characters[randomIndex]
            result += "\(randomCharacter)"
        }
        
        return result
    }
}

//MARK: Character Sets
private class Characters {
    static let alphabetic: Set<Character> = {
       let characters = "abcdefghijklmnopqrstuvwxyz"
        return Set(characters)
    }()
    
    static let numeric: Set<Character> = {
        let digits = Set(0...9)
        let characters = digits.map() { Character("\($0)") }
        return Set(characters)
    }()
    
    static var alphanumeric: Set<Character> {
        let combined = alphabetic.union(numeric)
        return Set(combined)
    }
    
    static let hex: Set<Character> = {
        let characters = "0123456789ABCDEF"
        return Set(characters)
    }()
}
