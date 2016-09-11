//
//  AlchemyGeneratorStringTests.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 9/10/16.
//  Copyright © 2016 Sir Wellington. All rights reserved.
//

import AlchemyGenerator
import Foundation
import XCTest

class AlchemyStringGeneratorTests: XCTestCase
{
    private var size: Int = 0
    private var iterations = 10
    
    private let alphabeticalCharacters: [Character] =
    {
        let lowerCased = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z".components(separatedBy: ",")
        
        let upperCased = lowerCased.map() { $0.uppercased() }
        
        let combined = lowerCased + upperCased
        return combined.map() { $0.characters.first! }
    }()
    
    private let numericCharacters: [Character] =
    {
        var numeric: [Character] = []
        for i in 0...9
        {
            numeric.append(Character.init("\(i)"))
        }
        return numeric
    }()
    
    override func setUp()
    {
        size = AlchemyGenerator.integer(from: 10, to: 100)
        iterations = AlchemyGenerator.integer(from: 10, to: 100)
    }
    
    func testNumericString()
    {
        let string = AlchemyGenerator.numericString(ofSize: size)
        XCTAssertEqual(string.characters.count, size)
    }
    
    func testAlphabeticalString()
    {
        for _ in (1...iterations)
        {
            let result = AlchemyGenerator.alphabeticString(ofSize: size)
            XCTAssertEqual(result.characters.count, size)
            
            ensure(string: result, areCharactersIn: alphabeticalCharacters)
        }
    }
    
    private func ensure(string: String, areCharactersIn set: [Character])
    {
        for character in string.characters
        {
            XCTAssert(set.contains(character), "Character \(character) is not in the expected set: \(set)")
        }
    }
}
