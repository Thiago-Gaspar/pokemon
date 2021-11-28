//
//  StartView.swift
//  PokeList
//
//  Created by Thiago Gaspar on 27/11/21.
//

import UIKit

class StartView: UIView {
    
    /* *****************************************************************************
     **
     **  MARK: Variables declaration
     **
     *******************************************************************************/
    
    var splashImageView : UIImageView!
    
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
        
        //-------------------- Splash Image View --------------------------------

        splashImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 307, height: 138))
        splashImageView.image = UIImage.gifImageWithName("splash")
        splashImageView.contentMode = .scaleAspectFit
        splashImageView.center.x = width/2
        splashImageView.center.y = height/2
        
        view.addSubview(splashImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

