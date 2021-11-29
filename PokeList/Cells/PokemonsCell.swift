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
        
        //------------------- Poke Image View  ------------------------------------

        pokeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width*0.25, height: height))
        pokeImageView.contentMode = .scaleAspectFit
        pokeImageView.layer.cornerRadius = 12
        pokeImageView.clipsToBounds = true
        
        contentView.addSubview(pokeImageView)
        
        //------------------- Name Label  ------------------------------------

        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width*0.5, height: 25))
        nameLabel.textColor = UIColor.appColor(.blue)
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.defaultFont(size: 20, type: .bold)
        nameLabel.minimumScaleFactor = 0.8
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.center.x = cardView.frame.width/2
        nameLabel.center.y = cardView.center.y
        
        contentView.addSubview(nameLabel)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

