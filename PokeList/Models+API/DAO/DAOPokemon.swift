//
//  DAOPokemons.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//


import Foundation
import CoreData
import UIKit

class DAOPokemon {
    
    fileprivate init() {
        
    }
    
    static func transformJSONInArrayPokemon(_ JSON : AnyObject) -> [Pokemon] {
        
        var array : [Pokemon] = []
        
        guard let data = JSON as? NSArray else {
            return array
        }
        
        for item in data {
            
            array.append(transformJSONInPokemon(item as AnyObject))
            
        }
        
        return array
        
    }
    
    static func transformJSONInPokemon(_ JSON : AnyObject) -> Pokemon {
        
        let item = Pokemon()
        
        if let info = JSON["name"] as? String {
            item.name = info
        }
        
        if let info = JSON["sprites"] as? [String : Any] {
            item.sprites = DAOSprites.transformJSONInSprites(info as AnyObject)
        }
       
        return item
        
    }
    
}


