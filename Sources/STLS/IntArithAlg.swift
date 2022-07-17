//
//  File.swift
//  
//
//  Created by Nathan Bedell on 7/17/22.
//

import Foundation
import Bow

protocol IntArithAlg {
    associatedtype F

    static func int(_: Int) -> Kind<F, Int>
    static func add(_: Kind<F, Int>, _: Kind<F, Int>) -> Kind<F, Int>
    static func times(_: Kind<F, Int>, _: Kind<F, Int>) -> Kind<F, Int>
}

struct IntArithAlgInterpreter: IntArithAlg {
    typealias F = ForId
    
    static func int(_ x: Int) -> Kind<ForId, Int> { return Id(value: x) }

    static func add(_ first: Kind<ForId, Int>, _ second: Kind<ForId, Int>) -> Kind<ForId, Int> {
        return Id(value: first.fix() + second.fix())
    }

    static func times(_ first: Kind<ForId, Int>, _ second: Kind<ForId, Int>) -> Kind<ForId, Int> {
        return Id(value: first.fix() * second.fix())
    }
}
