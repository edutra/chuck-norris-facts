//
//  FactListViewModel.swift
//  Chuck Norris Facts
//
//  Created by Enrique Dutra on 30/03/21.
//

import Foundation

class FactListViewModel{
    
    
    fileprivate let request: Request
    var facts: [Fact]?
    var delegate: FactListView?
    
    init(){
        self.request = Request()
    }
    
    
    func fetchFacts(by query: String){
        
        self.request.factsRequest(by: query) { (response) in
            self.facts = response
            
            DispatchQueue.main.async {
                self.delegate?.tableView.reloadData()
            }
        }
        
        
    }
}
