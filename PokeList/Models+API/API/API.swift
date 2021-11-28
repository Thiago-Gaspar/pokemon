//
//  API.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//

import Alamofire
import UIKit

class API {
    
    static let host = "https://pokeapi.co/api/v2/pokemon/"
    
    
    
    //------------------------- Singleton -----------------------------

    static let sharedInstance = API()
    
    var sessionManager : Session!
    
    /* *********************************************************************************
     **
     **  MARK: Init
     **
     ***********************************************************************************/


    fileprivate init() {

        //---------------------- Default Header ----------------------------

        var headers = HTTPHeaders.default

//        headers["Application-Version"] = "v1"
//        
//        headers["Content-Type"] = "application/json"
  

        //----------------------- URLSessionConfiguration ---------------------

        let configuration = URLSessionConfiguration.default

        configuration.headers = headers

        //----------------------- Session Manager -----------------------------

        sessionManager = Alamofire.Session(configuration: configuration)

    }

    
}



