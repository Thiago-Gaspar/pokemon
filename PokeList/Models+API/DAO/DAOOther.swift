//
//  DAOOther.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//

import Foundation
import CoreData
import UIKit

class DAOOther {
    
    fileprivate init() {
        
    }
    
    static func transformJSONInArrayOther(_ JSON : AnyObject) -> [Other] {
        
        var array : [Other] = []
        
        guard let data = JSON as? NSArray else {
            return array
        }
        
        for item in data {
            
            array.append(transformJSONInOther(item as AnyObject))
            
        }
        
        return array
        
    }
    
    static func transformJSONInOther(_ JSON : AnyObject) -> Other {
        
        let item = Other()
        
        if let info = JSON["dream_world"] as? [String : Any] {
            item.dreamWorld = DAODreamWorld.transformJSONInDreamWorld(info as AnyObject)
        }
       
        return item
        
    }
    
}


