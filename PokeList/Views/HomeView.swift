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
    
    var pokemonImageView : UIImageView!
    
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

        pokemonImageView = UIImageView(frame: CGRect(x: 0, y: 80, width: width*0.7, height: 100))
        pokemonImageView.image = UIImage(named: "logo")
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.clipsToBounds = true
        pokemonImageView.center.x = width/2
        
        view.addSubview(pokemonImageView)
        
        //-------------------- Table View --------------------------------

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height - pokemonImageView.frame.height - 20 - 50))
        tableView.frame.origin.y = pokemonImageView.frame.origin.y + pokemonImageView.frame.height + 20
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        view.addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

