//
//  FactListViewModel.swift
//  Chuck Norris Facts
//
//  Created by Enrique Dutra on 30/03/21.
//

import Foundation

protocol FactListViewModelDelegate: class{
    func didFetchFacts()
    func fetchError()
}

class FactListViewModel{
    
    
    fileprivate let request: Request
    var facts: [Fact]?
    var delegate: FactListViewModelDelegate?
    
    init(){
        self.request = Request()
    }
    
    
    func fetchFacts(by query: String){
        
        self.request.factsRequest(by: query) { (response) in
            self.facts = response
            
            
            if self.facts?.count ?? 0 > 0{
                self.delegate?.didFetchFacts()
            } else {
                self.delegate?.fetchError()
            }
            
            
        }
        
        
    }
}
