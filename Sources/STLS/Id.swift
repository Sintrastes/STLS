//
//  File.swift
//  
//
//  Created by Nathan Bedell on 7/17/22.
//

import Foundation

import Bow

/** Witness for the identity functor */
struct ForId { }
/** Identity functor with support for bow higher-kinded types. */
class Id<A> : Kind<ForId, A> {
    public let value: A

    init(value: A) {
        self.value = value
    }
}
