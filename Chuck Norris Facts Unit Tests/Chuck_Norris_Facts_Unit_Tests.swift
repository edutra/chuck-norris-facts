//
//  Chuck_Norris_Facts_Unit_Tests.swift
//  Chuck Norris Facts Unit Tests
//
//  Created by Enrique Dutra on 05/04/21.
//

import XCTest

@testable import Chuck_Norris_Facts

class FactListViewModelResponsavel: FactListViewModelDelegate, RequestProtocol{
    func factsRequest(by query: String, completion: @escaping (Result<[Fact], Error>) -> ()) {
        switch query{
        case "fail":
            fetchError()
            completion(.failure(NetworkRequestError.unknown(nil, nil)))
            
        case "success":
            didFetchFacts()
            completion(.success([]))
            
        default:
            completion(.failure(NetworkRequestError.unknown(nil, nil)))
            fetchError()
        }
        
    }
    
    
    var loadingError : Bool = false
    
    init() {
        
    }
    
    
    func didFetchFacts() {
        self.loadingError = false
    }
    
    func fetchError() {
        self.loadingError = true
    }
    
    
}

class Chuck_Norris_Facts_Unit_Tests: XCTestCase {
    
//    let viewModel = FactListViewModel()
//
//
    
    // TODO: - Colocar mais exemplos
    
    let example : [Fact] = [Fact(from: ["categories": [], "created_at": "", "icon_url": "", "id": "kscxjliptieuza9q5i5azg", "updated_at": "", "url": "https://api.chucknorris.io/jokes/kscxjliptieuza9q5i5azg", "value": "" ]),
                            Fact(from: ["categories": ["explicit"], "created_at": "", "icon_url": "", "id": "kscxjliptieuza9q5i5azg", "updated_at": "", "url": "https://api.chucknorris.io/jokes/kscxjliptieuza9q5i5azg", "value": "" ]),
                            Fact(from: ["categories": [], "created_at": "", "icon_url": "", "id": "kscxjliptieuza9q5i5azg", "updated_at": "", "url": "https://api.chucknorris.io/jokes/kscxjliptieuza9q5i5azg", "value": "" ]),
                            Fact(from: ["categories": ["explicit"], "created_at": "", "icon_url": "", "id": "kscxjliptieuza9q5i5azg", "updated_at": "", "url": "https://api.chucknorris.io/jokes/kscxjliptieuza9q5i5azg", "value": "" ])
    ]
    

//
    func atLeastOneCategoryPerFact(){

        

        let facts = example

        for fact in facts{

            XCTAssertTrue(fact.categories.count >= 1)
        }


    }

    
    // Quando o request retorna um erro, o boolean loadingError recebe o valor true.
    // Quando contrário, recebe o valor false.
    func errorToggleError(){
    

        let viewModel = FactListViewModelResponsavel()
        
        
        viewModel.factsRequest(by: "fail") { (response) in
            switch response{
            case .success([]):
                XCTAssertFalse(viewModel.loadingError)
            case .failure(NetworkRequestError.unknown(nil, nil)):
                XCTAssertTrue(viewModel.loadingError)
            default:
            XCTAssertFalse(viewModel.loadingError)
            }
            
        }
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            
            atLeastOneCategoryPerFact()
            errorToggleError()
//            noFactFoundEqualsZeroFactsInViewModel()
            // Put the code you want to measure the time of here.
            
        }
    }

}
