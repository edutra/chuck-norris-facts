//
//  Fact.swift
//  Chuck Norris Facts
//
//  Created by Enrique Dutra on 29/03/21.
//
import Foundation

class Fact{
    
    
    var iconUrl: String
    var id: String
    var value: String
    var url: URL?
    var categories: [String]//[FactCategory]
    
    

    init(from json: [String: Any]) {
        self.iconUrl = json["icon_url"] as! String
        self.categories = json["categories"] as! [String]
        self.value = json["value"] as! String
        self.id = json["id"] as! String
        guard let url = URL(string: json["url"] as! String) else {return}
        
        self.url = url
    }
}