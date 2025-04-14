//
//  AlchemyGenerator+Arrays.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 9/11/16.
//  Copyright © 2025 Sir Wellington. All rights reserved.
//

import Foundation

//======================================
// MARK: Array Generation Classes
//======================================
public extension AlchemyGenerator {

    class Arrays {
        public static var ofString: [String] {
            return AlchemyGenerator.array() {
                return AlchemyGenerator.alphanumericString()
            }
        }
        
        public static var ofAlphabeticString: [String] {
            return AlchemyGenerator.array() { AlchemyGenerator.alphabeticString() }
        }
        
        public static var ofAlphanumericString: [String] {
            return AlchemyGenerator.array() { AlchemyGenerator.alphanumericString() }
        }
        
        public static var ofIntegers: [Int] {
            return AlchemyGenerator.array(
                creator: AlchemyGenerator.anyInteger
            )
        }
        
        public static var ofPositiveIntegers: [Int] {
            return AlchemyGenerator.array(
                creator: AlchemyGenerator.positiveInteger
            )
        }

        /**
            Creates an [Array] with `size` elements, where each element is taken from the
            `producer` parameter.

            @see [AlchemyGenerator.array].
        */
        public static func of<T>(
            size: Int = AlchemyGenerator.defaultSize,
            _ producer: () -> T
        ) -> [T] {
            return (0..<size).map { _ in producer() }
        }
    }
}


//MARK: List Generation Methods
public extension AlchemyGenerator {

    static var defaultSize: Int {
        return integer(from: 5, to: 50)
    }
    
    static func array<T>(size: Int = defaultSize, creator: () -> T) -> [T] {
        guard size > 0 else { return [] }
        
        var result: [T] = []
        
        for _ in (1...size)
        {
            let newElement = creator()
            result.append(newElement)
        }
        
        return result
    }
    
    static func set<T>(
        size: Int = defaultSize,
        creator: () -> T
    ) -> Set<T> {
        guard size > 0 else { return Set() }
        
        var result: Set<T> = Set()
        
        for _ in 1...size {
            let newElement = creator()
            result.insert(newElement)
        }
        
        return result
    }
    
    static func anyOf<T>(_ array: [T]) -> T? {
        guard !array.isEmpty else { return nil }
        
        let index = integer(from: 0, to: array.count)
        
        return array[index]
    }
}
