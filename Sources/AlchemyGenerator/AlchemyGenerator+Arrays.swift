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
            AlchemyGenerator.array() {
                 AlchemyGenerator.alphanumericString()
            }
        }
        
        public static var ofAlphabeticString: [String] {
            AlchemyGenerator.array() {
                AlchemyGenerator.alphabeticString()
            }
        }
        
        public static var ofAlphanumericString: [String] {
            AlchemyGenerator.array() {
                AlchemyGenerator.alphanumericString()
            }
        }
        
        public static var ofIntegers: [Int] {
            AlchemyGenerator.array(
                creator: AlchemyGenerator.anyInteger
            )
        }
        
        public static var ofPositiveIntegers: [Int] {
            AlchemyGenerator.array(
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
        integer(
            fromInclusive: 5,
            toInclusive: 50
        )
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
        
        let index = integer(
            fromInclusive: 0,
            toInclusive: array.count
        )
        
        return array[index]
    }
}
