//
//  HomeView.swift
//  PokeList
//
//  Created by Thiago Gaspar on 27/11/21.
//

import UIKit

class HomeView: UIView {
    
    /* *****************************************************************************
     **
     **  MARK: Variables declaration
     **
     *******************************************************************************/
    
    var pokemonsLabel : UILabel!
    
    var tableView : UITableView!
    
    /* ******************************************************************************
     **
     **  MARK: Init
     **
     ********************************************************************************/
    
    init(view: UIView, parent: UIViewController) {
        super.init(frame: view.frame)
        
        let width = view.frame.width
        let height = view.frame.height
        
        view.backgroundColor = .white
        
        //-------------------- Pokemons Label --------------------------------

        pokemonsLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        pokemonsLabel.text = "Pokemons"
        pokemonsLabel.textColor = UIColor(hex: 333333)
        pokemonsLabel.font = UIFont.defaultFont(size: 28, type: .bold)
        pokemonsLabel.sizeToFit()
        pokemonsLabel.center.x = width/2
        pokemonsLabel.frame.origin.y = height*0.065
        
        view.addSubview(pokemonsLabel)
        
        //-------------------- Table View --------------------------------

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height - pokemonsLabel.frame.height - 20 - 50))
        tableView.frame.origin.y = pokemonsLabel.frame.origin.y + pokemonsLabel.frame.height + 20
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        view.addSubview(tableView)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

