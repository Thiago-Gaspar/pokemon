//
//  PokemonsCell.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//

import UIKit

class PokemonsCell: UITableViewCell {
    
    /* **************************************************************************************************
     **
     **  MARK: Variables declaration
     **
     ****************************************************************************************************/
    
    var cardView : CardView!
    
    var pokeImageView : UIImageView!
    
    var nameLabel : UILabel!
    
    var idLabel : UILabel!
        
    /* **************************************************************************************************
     **
     **  MARK: Init
     **
     ***************************************************************************************************/
    
    init(view: UIView) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        
        let width = view.frame.size.width
        let height : CGFloat = 100
        
        self.backgroundColor = .clear
        
        self.selectionStyle = .none
        
        //------------------- Card View  ------------------------------------
        
        cardView = CardView(frame: CGRect(x: 0, y: 0, width: width*0.9, height: height))
        cardView.backgroundColor = .white
        cardView.center.x = width/2
        
        contentView.addSubview(cardView)
        
        let cardWidth = cardView.frame.width
        
        //------------------- Poke Image View  ------------------------------------

        pokeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cardWidth*0.25, height: height))
        pokeImageView.contentMode = .scaleAspectFit
        pokeImageView.layer.cornerRadius = 12
        pokeImageView.clipsToBounds = true
        pokeImageView.frame.origin.x = cardView.frame.origin.x
        
        contentView.addSubview(pokeImageView)
        
        //------------------- Name Label  ------------------------------------

        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: cardWidth*0.5, height: 25))
        nameLabel.textColor = UIColor.appColor(.blue)
        nameLabel.font = UIFont.defaultFont(size: 20, type: .bold)
        nameLabel.minimumScaleFactor = 0.8
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.frame.origin.x = pokeImageView.frame.origin.x + pokeImageView.frame.width + 15
        nameLabel.center.y = cardView.center.y
        
        contentView.addSubview(nameLabel)
        
        //------------------- Id Label  ------------------------------------

        idLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width*0.5, height: 25))
        idLabel.textColor = UIColor(hex: 15652916)
        idLabel.font = UIFont.defaultFont(size: 20, type: .bold)
        idLabel.minimumScaleFactor = 0.8
        idLabel.adjustsFontSizeToFitWidth = true
        idLabel.frame.origin.x = nameLabel.frame.origin.x + nameLabel.frame.width + 15
        idLabel.center.y = cardView.center.y
        
        contentView.addSubview(idLabel)
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Expand Cell
     **
     ***************************************************************************************************/
    
    func expandCell(height : CGFloat) {
        
        cardView.frame.size.height = height
        
//        arrowImageView.image = UIImage(named: "dropdown")?.sd_rotatedImage(withAngle: .pi, fitSize: false)
                
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Hide Cell
     **
     ***************************************************************************************************/
    
    func hideCell() {
        
        cardView.frame.size.height = 100
        
//        arrowImageView.image = UIImage(named: "dropdown")
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

