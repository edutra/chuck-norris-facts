//
//  Fact.swift
//  Chuck Norris Facts
//
//  Created by Enrique Dutra on 29/03/21.
//
import Foundation

class Fact: Equatable{
    static func == (lhs: Fact, rhs: Fact) -> Bool {
        lhs.id == rhs.id
    }
    
    
    
    var iconUrl: String
    var id: String
    var value: String
    var url: URL?
    var categories: [FactCategory] = []
    
    

    init(from json: [String: Any]){
        self.iconUrl = json["icon_url"] as! String
        self.value = json["value"] as! String
        self.id = json["id"] as! String
        guard let url = URL(string: json["url"] as! String) else {return}
        
        self.url = url
        
        let categories =  json["categories"] as! [String]
        
        if categories.count == 0 {
            self.categories.append(.uncategorized)
        } else {
            for category in categories{
                
                self.categories.append(FactCategory(rawValue: category) ?? .uncategorized)
            }
        }
        
    }
}
