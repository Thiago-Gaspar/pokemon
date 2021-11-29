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
            
            print("request - getAllPokemons")
            print(response.result)

            switch response.result {
                
            case let .success(value):
                
                resposta.statusCode = response.response?.statusCode ?? 0
                                
                if response.response?.statusCode == 200 {
                    
                    let JSON = value as AnyObject
                    
                    if let results = JSON["results"] as? [[String : Any]] {
                        
                        resposta.url = DAOUrl.transformJSONInArrayUrl(results as AnyObject)
                        
                        let urls = resposta.url
                        
                        if urls.count > 0 {
                            
                            for url in urls {
                                
                                let newURL = url.url
                                
                                API.sharedInstance.sessionManager.request(newURL,
                                                                          method: HTTPMethod.get,
                                                                          parameters: nil,
                                                                          encoding: URLEncoding.default,
                                                                          headers: nil
                                ).responseJSON(completionHandler: { response in
                                                                        
                                    print(response.result)
                                    
                                    switch response.result {
                                        
                                    case let .success(value):
                                        
                                        resposta.statusCode = response.response?.statusCode ?? 0
                                                        
                                        if response.response?.statusCode == 200 {
                                            
                                            let JSON = value as AnyObject
                                            
                                            resposta.pokemon = DAOPokemon.transformJSONInPokemon(JSON as AnyObject)
                                            
                                            resposta.pokemons.append(resposta.pokemon)
                                            
                                            resposta.success = true
                                            callback(resposta)
                                            
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
    
    
}

