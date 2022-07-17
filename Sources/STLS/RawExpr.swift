//
//  RawExpr.swift
//  
//
//  Created by Nathan Bedell on 7/17/22.
//

import Foundation

indirect enum RawExpr: Codable {
    case const(value: String)
    case lam(identifier: String, body: RawExpr)
    case app(f: RawExpr, x: RawExpr)
    case variable(identifier: String)
    case customOp(identifier: String)
}
