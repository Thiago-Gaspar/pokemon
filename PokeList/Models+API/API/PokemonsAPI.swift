//
//  PokemonsAPI.swift
//  PokeList
//
//  Created by Thiago Gaspar on 28/11/21.
//

import UIKit
import Alamofire

class PokemonsAPI {
    
    fileprivate init() {
        
    }
    
    /* *********************************************************************************
     **
     **  MARK: Get All Pokemons
     **
     ***********************************************************************************/
    
    static func getAllPokemons(callback: @escaping (ServerResponse) -> Void) {
        
        let newUrl = API.host
        
        print("request - getAllPokemons")
        print(newUrl)
        
        let headers = HTTPHeaders()
        
        API.sharedInstance.sessionManager.request(newUrl,
                                                  method: HTTPMethod.get,
                                                  parameters: nil,
                                                  encoding: URLEncoding.default,
                                                  headers: headers
        ).responseJSON(completionHandler: { response in
            
            let resposta = ServerResponse()
            
            print("request - getAllPokemons")
            print(response.result)

            switch response.result {
                
            case let .success(value):
                
                resposta.statusCode = response.response?.statusCode ?? 0
                
                let JSON = value as AnyObject
                
                if response.response?.statusCode == 200 {
                    
                    print(response.result)
                    resposta.success = true
                    callback(resposta)
                    
                    return
                }
                
            case let .failure(error):
                print(error)
                
            }
            
            resposta.success = false
            resposta.erroMessage = ""
            callback(resposta)
            
            return
            
        })
                                                  
        
    }
    
    
}

