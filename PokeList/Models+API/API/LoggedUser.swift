//
//  LoggedUser.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//

import UIKit

public struct PreferenceKeys {
    static let pokemonsKey : String = "pokemonsKey"
}

class LoggedUser {
    
    static let sharedInstance = LoggedUser()
        
    fileprivate init () {
        
    }
    
}
