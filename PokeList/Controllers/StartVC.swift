//
//  StartVC.swift
//  PokeList
//
//  Created by Thiago Gaspar on 27/11/21.
//

import UIKit

class StartVC: UIViewController {
    
    /* *****************************************************************************
     **
     **  MARK: Variables declaration
     **
     *******************************************************************************/
    
    var startView : StartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startView = StartView(view: view, parent: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }


}


