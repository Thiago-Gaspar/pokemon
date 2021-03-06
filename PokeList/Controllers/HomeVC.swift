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
    
    var offset = 0
        
    var cellTapped : Bool = false
    
    var rowIndex : IndexPath = IndexPath.init(row: -1, section: -1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView = HomeView(view: view, parent: self)
        
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.offset = 0
        
        self.loadPokemons()
        
    }
    
    func loadPokemons() {
        
        self.startLoading()
        
        PokemonsAPI.getAllPokemons(offset: self.offset) { urlResponse in 
            
            self.stopLoading()
            
            if urlResponse.success {
                
                for url in urlResponse.url {
                    
                    let number = Int(url.url.westernArabicNumeralsOnly.dropFirst())
                                        
                    PokemonsAPI.getPokeInfos(url: url.url) { pokeResponse in
                                                
                        if pokeResponse.success {
                            
                            self.pokemons.insert(pokeResponse.pokemon, at: self.pokemons.count)
                            
                            self.pokemons = self.pokemons.sorted(by: {$0.id < $1.id})
                            
                            if self.pokemons.count == number {
                                
                                self.homeView.tableView.reloadData()
                                                                                                                                
                            }
                            
                        } else {
                            
                            GenericAlert.genericAlert(self, title: pokeResponse.erroMessage, message: "", actions: [])
                            
                        }
                        
                    }
                    
                }
                
            } else {
                
                GenericAlert.genericAlert(self, title: urlResponse.erroMessage, message: "", actions: [])
            }
            
        }
        
    }
    
    func changeCellSize(indexPath : IndexPath) {
        
        let cell = homeView.tableView.cellForRow(at: indexPath) as? PokemonsCell
        
        if cellTapped {
            
            cell?.frame.size.height = 240
            cell?.cardView.frame.size.height = 200
            
        } else {
            
            cell?.frame.size.height = 120
            cell?.cardView.frame.size.height = 100
            
        }
        
    }
    
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = PokemonsCell(view: view)
        
        cell.delegate = self
        cell.index = indexPath.row
        
        switch self.pokemons[indexPath.row].types[0].type {
        case "grass":
            cell.cardView.backgroundColor = .green
        case "poison":
            cell.cardView.backgroundColor = .purple
        case "fire":
            cell.cardView.backgroundColor = .orange
        case "water":
            cell.cardView.backgroundColor = .blue
        case "normal":
            cell.cardView.backgroundColor = .white
        case "bug":
            cell.cardView.backgroundColor = .systemGreen
        case "electric":
            cell.cardView.backgroundColor = .yellow
        case "fairy":
            cell.cardView.backgroundColor = .systemPink
        case "ground":
            cell.cardView.backgroundColor = .brown
        default:
            break
        }
                
        let url = URL(string: self.pokemons[indexPath.row].sprites.other.image.defaultImage)
        
        if url != nil {
            
            cell.pokeImageView.sd_setImage(with: url, completed: nil)
            
        }
        
        cell.nameLabel.text = self.pokemons[indexPath.row].name
        
        cell.idLabel.text = "#\(self.pokemons[indexPath.row].id)"
        
        if tableView.rectForRow(at: indexPath).size.height >= 121 {
            
            cell.expandCell(height: 220)
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == rowIndex.row && cellTapped  {
            
            return 240
            
        }
        
        return 120
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? PokemonsCell {
            
            tableView.beginUpdates()
            
            //Caso de fechar a cell:
            
            if cellTapped {
                
                let closeRow = rowIndex
                
                rowIndex = indexPath
                
                //Escondendo itens da cell
                
                if let closeCell = tableView.cellForRow(at: closeRow) as? PokemonsCell {
                    
                    closeCell.hideCell()
                    
                }
                
                //Caso de ter pressionado a cell para fechar
                
                if closeRow.row == indexPath.row {
                    
                    self.cellTapped = false
                    self.rowIndex.row = -1
                    
                    tableView.reloadRows(at: [closeRow], with: .automatic)
                    
                    tableView.endUpdates()
                    
                    return
                    
                } else {
                    
                    tableView.reloadRows(at: [closeRow], with: .automatic)
                    
                }
                
                //Se n??o deu return, fechou a cell que estava aberta e agora tem que abrir a nova
                
            }
            
            //Caso de abrir a cell:
            
            cellTapped = true
            rowIndex = indexPath
            
            tableView.reloadRows(at: [rowIndex], with: .automatic)
            
            tableView.endUpdates()
            
            //Abrindo a cell
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
                cell.expandCell(height: 220)
                
            }
            
        }
        
    }
    
}

extension HomeVC : PokemonsCellDelegate {
    func cellClicked(index: Int) {
        let vc = PokemonVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
