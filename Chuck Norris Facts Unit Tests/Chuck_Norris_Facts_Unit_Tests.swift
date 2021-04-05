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
//    let example : [Category] = [Category(]
//    
//    
//    func atLeastOneCategoryPerFact(){
//        
//        viewModel.fetchFacts(by: "Dog")
//        
//        let facts = viewModel.facts
//        
//        for fact in facts!{
//            
//            XCTAssertTrue(fact.categories.count >= 1)
//        }
//        
//        
//    }

    
    
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
