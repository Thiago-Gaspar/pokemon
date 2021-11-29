//
//  DAOSprites.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//


import Foundation
import CoreData
import UIKit

class DAOSprites {
    
    fileprivate init() {
        
    }
    
    static func transformJSONInArraySprites(_ JSON : AnyObject) -> [Sprites] {
        
        var array : [Sprites] = []
        
        guard let data = JSON as? NSArray else {
            return array
        }
        
        for item in data {
            
            array.append(transformJSONInSprites(item as AnyObject))
            
        }
        
        return array
        
    }
    
    static func transformJSONInSprites(_ JSON : AnyObject) -> Sprites {
        
        let item = Sprites()
        
        if let info = JSON["other"] as? [String : Any] {
            item.other = DAOOther.transformJSONInOther(info as AnyObject)
        }
       
        return item
        
    }
    
}


