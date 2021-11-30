//
//  DAOImage.swift
//  PokeList
//
//  Created by Thiago Gaspar on 29/11/21.
//

import Foundation
import CoreData
import UIKit

class DAOImage {
    
    fileprivate init() {
        
    }
    
    static func transformJSONInArrayImage(_ JSON : AnyObject) -> [Image] {
        
        var array : [Image] = []
        
        guard let data = JSON as? NSArray else {
            return array
        }
        
        for item in data {
            
            array.append(transformJSONInImage(item as AnyObject))
            
        }
        
        return array
        
    }
    
    static func transformJSONInImage(_ JSON : AnyObject) -> Image {
        
        let item = Image()
        
        if let info = JSON["front_default"] as? String {
            item.defaultImage = info
        }
       
        return item
        
    }
    
}


