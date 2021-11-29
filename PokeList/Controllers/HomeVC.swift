//
//  HomeVC.swift
//  PokeList
//
//  Created by Thiago Gaspar on 27/11/21.
//


import UIKit
import SDWebImage

class HomeVC: UIViewController {
    
    /* *****************************************************************************
     **
     **  MARK: Variables declaration
     **
     *******************************************************************************/
    
    var homeView : HomeView!
    
    var pokemons : [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView = HomeView(view: view, parent: self)
        
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        PokemonsAPI.getAllPokemons { response in
            
            if response.success {
                
                if response.res
                
                self.pokemons = response.pokemons
                
            } else {
                
                GenericAlert.genericAlert(self, title: "RUIM", message: "", actions: [])
            }
            
        }
        
        
    }

}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = PokemonsCell(view: view)
        
        let url = URL(string: self.pokemons[indexPath.row].sprites.other.dreamWorld.image)
            
        if url != nil {
            
            cell.pokeImageView.sd_setImage(with: url, completed: nil)
            
        }
        
        return cell
        
    }

}
