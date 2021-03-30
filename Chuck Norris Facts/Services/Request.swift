//
//  Request.swift
//  Chuck Norris Facts
//
//  Created by Enrique Dutra on 29/03/21.
//

import Foundation

class Request{
    let session = URLSession.shared
    let url = "https://api.chucknorris.io/jokes/search?query="
    
    
    
    func factsRequest(by query: String, completion: @escaping ([Fact]) -> ()){
    
        if let url = URL(string: self.url + query){
            let task = URLSession.shared.dataTask(with: url) { (nsData, urlResponse, error) in
                
                var facts: [Fact] = []
                
                if error == nil{
                    if let backData = nsData {
                        do{
                            let jsonResult = try JSONSerialization.jsonObject(with: backData, options: .allowFragments)
                            
                            if let eventJson = jsonResult as? [String : Any] {
                                
                                
                                // Desemcapsula a resposta
                                let result = eventJson["result"] as! [[String:Any]]

                                for fact in result{
                                    if let factObject = try? Fact(from: fact){
                                        facts.append(factObject)
                                    }
                                }
                                
                                
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                        completion(facts)
                    }
                }
                
            }
            task.resume()
        }
    }
    
    

    
}
