//
//  GenSym.swift
//  
//
//  Created by Nathan Bedell on 7/17/22.
//

import Foundation

protocol GenSym {
    static func genSym(prefix: String) -> String
}

class GenSymImpl: GenSym {
    private static var latest: Int = 0
    
    static func genSym(prefix: String) -> String {
        return "\(latest)\(prefix)"
    }
}
