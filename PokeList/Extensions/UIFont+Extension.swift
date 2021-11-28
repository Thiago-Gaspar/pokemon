//
//  UIFont+Extension.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//


import UIKit

enum FontType : CaseIterable {
    case regular
    case bold
    case medium
    case italic
    case light
    case semiBold
    
}

extension UIFont {
    
    static var fontName = ""
    
    static var mediumFontName = ""
    
    static var italicFontName = ""
    
    static var lightFontName = ""
    
    static var boldFontName = ""
    
    static var semiBoldFontName = ""
    
    static func defaultFont(size : CGFloat, type : FontType) -> UIFont {
        
        switch type {
            
        case .regular:
            return UIFont.systemFont(ofSize: size)
            
        case .bold:
            return UIFont.boldSystemFont(ofSize: size)
          
        case .medium:
            return UIFont.systemFont(ofSize: size)
            
        case .italic:
            return UIFont.italicSystemFont(ofSize: size)
            
        case .light:
            return UIFont.systemFont(ofSize: size)
            
        case .semiBold:
            return UIFont.boldSystemFont(ofSize: size)
            
        }
        
    }
    
}


