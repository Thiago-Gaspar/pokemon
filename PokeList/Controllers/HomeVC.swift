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
    
    var pokemons : [Pokemons] = []

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
                
                for url in response.url {
                    
                    PokemonsAPI.getPokeInfos(url: url.url) { response in
                        
                        if response.success {
                                                        
                            self.pokemons.insert(response.pokemon, at: self.pokemons.count)
                            
                            self.homeView.tableView.reloadData()
                                                        
                        } else {
                            
                            GenericAlert.genericAlert(self, title: response.erroMessage, message: "", actions: [])
                            
                        }
                        
                    }
                    
                    let number = Int(url.url.components(separatedBy: CharacterSet.decimalDigits).joined())
                    
                    if number == response.url.count - 1 {
                        
                        break
                        
                    }
                    
                }
                
            } else {
                
                GenericAlert.genericAlert(self, title: response.erroMessage, message: "", actions: [])
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
        
        let url = URL(string: self.pokemons[indexPath.row].sprites.other.image.defaultImage)
        
        print(url)
            
        if url != nil {
            
            cell.pokeImageView.sd_setImage(with: url, completed: nil)
            
        }
        
        cell.nameLabel.text = self.pokemons[indexPath.row].name
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
        
    }

}
