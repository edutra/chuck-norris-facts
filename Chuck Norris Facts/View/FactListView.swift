//
//  FactListView.swift
//  Chuck Norris Facts
//
//  Created by Enrique Dutra on 30/03/21.
//

import Foundation
import UIKit


class FactListView: UIViewController{
    
    override func viewDidLoad() {
        let request = Request()
        
        request.factsRequest(by: "cat") { (facts) in
            for fact in facts{
                print(fact.value)
            }
        }
    }
    
}
