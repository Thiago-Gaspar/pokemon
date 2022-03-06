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
        
        let newUrl = API.host + "?limit=2&offset=0"
        
        print("request - getAllPokemons")
        print(newUrl)
                
        API.sharedInstance.sessionManager.request(newUrl,
                                                  method: HTTPMethod.get,
                                                  parameters: nil,
                                                  encoding: URLEncoding.default,
                                                  headers: nil
        ).responseJSON(completionHandler: { response in
            
            let resposta = ServerResponse()
            
            print("response - getAllPokemons")
            print(response.result)

            switch response.result {
                
            case let .success(value):
                
                resposta.statusCode = response.response?.statusCode ?? 0
                                
                if response.response?.statusCode == 200 {
                    
                    let JSON = value as AnyObject
                    
                    if let results = JSON["results"] as? [[String : Any]] {
                        
                        resposta.url = DAOUrl.transformJSONInArrayUrl(results as AnyObject)
                        
                        resposta.success = true
                        callback(resposta)
                        
                        return
                        
                    }
                   
                }
                
            case let .failure(error):
                print(error)
                
            }
            
            resposta.success = false
            resposta.erroMessage = "Deu ruim"
            callback(resposta)
            
            return
            
        })
        
    }
    
    /* *********************************************************************************
     **
     **  MARK: Get Poke Infos
     **
     ***********************************************************************************/
    
    static func getPokeInfos(url : String, callback: @escaping (ServerResponse) -> Void) {
        
        let newUrl = url
        
        print("request - getPokeInfos")
        print(newUrl)
                
        API.sharedInstance.sessionManager.request(newUrl,
                                                  method: HTTPMethod.get,
                                                  parameters: nil,
                                                  encoding: URLEncoding.default,
                                                  headers: nil
        ).responseJSON(completionHandler: { response in
            
            print("response - getPokeInfos")
            print(response.result)
            
            let resposta = ServerResponse()

            switch response.result {

            case let .success(value):

                resposta.statusCode = response.response?.statusCode ?? 0

                if response.response?.statusCode == 200 {

                    let JSON = value as AnyObject

                    resposta.pokemon = DAOPokemons.transformJSONInPokemons(JSON as AnyObject)
                    
                    resposta.success = true
                    callback(resposta)
                    
                    return

                }

            case let .failure(error):

                print(error)

            }

            resposta.success = false
            resposta.erroMessage = "Deu ruim"
            callback(resposta)

        })
                                                  
        
    }
    
}

