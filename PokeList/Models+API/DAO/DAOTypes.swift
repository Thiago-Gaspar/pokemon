//
//  DAOTypes.swift
//  PokeList
//
//  Created by Thiago Gaspar on 08/03/22.
//

import Foundation
import CoreData
import UIKit

class DAOTypes {
    
    fileprivate init() {
        
    }
    
    static func transformJSONInArrayTypes(_ JSON : AnyObject) -> [Types] {
        
        var array : [Types] = []
        
        guard let data = JSON as? NSArray else {
            return array
        }
        
        for item in data {
            
            array.append(transformJSONInTypes(item as AnyObject))
            
        }
        
        return array
        
    }
    
    static func transformJSONInTypes(_ JSON : AnyObject) -> Types {
        
        let item = Types()
        
        if let info = JSON["slot"] as? Int {
            item.slot = info
        }
        
        if let info = JSON["type"] as? [String : Any] {
            
            for name in info {
                
                if name.key == "name" {
                    
                    item.type = name.value as! String
                    
                }
                
            }
            
        }
       
        return item
        
    }
    
}


