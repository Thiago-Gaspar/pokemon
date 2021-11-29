//
//  DAODreamWorld.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//


import Foundation
import CoreData
import UIKit

class DAODreamWorld {
    
    fileprivate init() {
        
    }
    
    static func transformJSONInArrayDreamWorld(_ JSON : AnyObject) -> [DreamWorld] {
        
        var array : [DreamWorld] = []
        
        guard let data = JSON as? NSArray else {
            return array
        }
        
        for item in data {
            
            array.append(transformJSONInDreamWorld(item as AnyObject))
            
        }
        
        return array
        
    }
    
    static func transformJSONInDreamWorld(_ JSON : AnyObject) -> DreamWorld {
        
        let item = DreamWorld()
        
        if let info = JSON["front_default"] as? String {
            item.image = info
        }
       
        return item
        
    }
    
}


