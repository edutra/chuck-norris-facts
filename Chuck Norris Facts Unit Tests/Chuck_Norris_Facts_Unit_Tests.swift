//
//  Chuck_Norris_Facts_Unit_Tests.swift
//  Chuck Norris Facts Unit Tests
//
//  Created by Enrique Dutra on 05/04/21.
//

import XCTest
@testable import Chuck_Norris_Facts

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
//            noFactFoundEqualsZeroFactsInViewModel()
            // Put the code you want to measure the time of here.
            
        }
    }

}
