//
//  DAOPokemons.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//


import Foundation
import CoreData
import UIKit

class DAOPokemons {
    
    fileprivate init() {
        
    }
    
    static func transformJSONInArrayPokemons(_ JSON : AnyObject) -> [Pokemons] {
        
        var array : [Pokemons] = []
        
        guard let data = JSON as? NSArray else {
            return array
        }
        
        for item in data {
            
            array.append(transformJSONInPokemons(item as AnyObject))
            
        }
        
        return array
        
    }
    
    static func transformJSONInPokemons(_ JSON : AnyObject) -> Pokemons {
        
        let item = Pokemons()
        
        if let info = JSON["id"] as? Int {
            item.id = info
        }
        
        if let info = JSON["name"] as? String {
            item.name = info
        }
        
        if let info = JSON["sprites"] as? [String : Any] {
            item.sprites = DAOSprites.transformJSONInSprites(info as AnyObject)
        }
        
        if let info = JSON["order"] as? Int {
            item.order = info
        }
        
        if let info = JSON["types"] as? [[String : Any]] {
            item.types = DAOTypes.transformJSONInArrayTypes(info as AnyObject)
        }
       
        return item
        
    }
    
}


