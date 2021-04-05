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
    
    
    fileprivate let request: RequestProtocol
    var facts: [Fact]?
    var delegate: FactListViewModelDelegate?
    
    init(with request: RequestProtocol = Request()){
        self.request = request
    }
    
    
    func fetchFacts(by query: String){
        
        self.request.factsRequest(by: query) { (response) in
//            self.facts = response
            
            switch response{
            case .failure(let error):
                print(error)
                self.delegate?.fetchError()
                
            case .success(let facts):
                self.facts = facts
                if self.facts?.count ?? 0 > 0{
                    self.delegate?.didFetchFacts()
                } else {
                    self.delegate?.fetchError()
                }
            }
            
            
            
        }
        
        
    }
}
