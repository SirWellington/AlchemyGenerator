//
//  AlchemyGenerator+Booleans.swift
//  AlchemyGenerator
//
//  Created by Wellington Moreno on 07/27/2018.
//  Copyright © 2025 SirWellington. All rights reserved.
//

import Foundation


//======================================
// MARK: BOOLEANS
//======================================
public extension AlchemyGenerator {
    class Booleans {
        public static var any: Bool {
            Integers.positive % 2 == 0
        }
    }

    static func boolean() -> Bool {
        return Booleans.any
    }
}
