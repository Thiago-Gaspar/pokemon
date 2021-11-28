//
//  HomeVC.swift
//  PokeList
//
//  Created by Thiago Gaspar on 27/11/21.
//


import UIKit

class HomeVC: UIViewController {
    
    /* *****************************************************************************
     **
     **  MARK: Variables declaration
     **
     *******************************************************************************/
    
    var homeView : HomeView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView = HomeView(view: view, parent: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }


}


