//
//  DAOUrl.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//


import Foundation
import CoreData
import UIKit

class DAOUrl {
    
    fileprivate init() {
        
    }
    
    static func transformJSONInArrayUrl(_ JSON : AnyObject) -> [Url] {
        
        var array : [Url] = []
        
        guard let data = JSON as? NSArray else {
            return array
        }
        
        for item in data {
            
            array.append(transformJSONInUrl(item as AnyObject))
            
        }
        
        return array
        
    }
    
    static func transformJSONInUrl(_ JSON : AnyObject) -> Url {
        
        let item = Url()
        
        if let info = JSON["url"] as? String {
            item.url = info 
        }
       
        return item
        
    }
    
}


