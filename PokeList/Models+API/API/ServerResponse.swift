//
//  ServerResponse.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//

import UIKit

class ServerResponse {
    
    var success : Bool = false
    var erroMessage : String = ""
    var statusCode : Int = 0
    var url : [Url] = []
    var pokemon : Pokemons!
    var pokemons : [Pokemons] = []
    
    init () {
        
    }
}
