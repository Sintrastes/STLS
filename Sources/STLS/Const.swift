//
//  File.swift
//  
//
//  Created by Nathan Bedell on 7/17/22.
//

import Foundation
import Bow

/** Witness for the Const functor */
struct ForConst<A> { }
/** Const functor with support for bow higher-kinded types. */
class Const<A, B> : Kind<ForConst<A>, B> {
    public let value: A
    
    init(value: A) {
        self.value = value
    }
}

extension Kind where F == ForConst<A> {
    func fix() -> A {
        return (self as! Const<A, Any>).value
    }
}
