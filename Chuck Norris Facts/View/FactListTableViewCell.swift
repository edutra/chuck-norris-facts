//
//  FactListTableViewCell.swift
//  Chuck Norris Facts
//
//  Created by Enrique Dutra on 30/03/21.
//

import Foundation
import UIKit

class FactListTableViewCell: UITableViewCell{
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    
    func configure(with fact: Fact){
        
        self.factLabel.text = fact.value
        print(fact.value.count)
        if fact.value.count >= 80{
            self.factLabel.font = UIFont(name: "System", size: 14.0)
        } else {
            self.factLabel.font = UIFont(name: "System", size: 24.0)
        }
        
        let categories = fact.categories
        
        if categories.count > 0 {
            self.categoryLabel.text = categories[0].rawValue
        } else {
            self.categoryLabel.text = FactCategory.uncategorized.rawValue
        }
        
        
    }
}
