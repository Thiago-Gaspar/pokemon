//
//  GenericAlert.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.


import UIKit

class GenericAlert {
    
    static func genericAlert(_ viewController: UIViewController!, title: String!, message: String!, actions: [UIAlertAction]) {
        
        let alertController = UIAlertController(title: localizedString(title), message: localizedString(message), preferredStyle: .alert)
        
        if(actions.count == 0){
            
            alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
        } else {
            
            for action in actions {
                
                alertController.addAction(action)
                
            }
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            viewController.present(alertController, animated: true, completion: nil)
            
        })
        
    }
    
    static fileprivate func localizedString(_ string : String) -> String {
        
        let text = NSLocalizedString(string, comment:"DocPadGenericAlert - \(string)")
        
        if(text.isEmpty){
            return string
        }
        
        return text
        
    }
    
}





