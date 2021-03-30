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
        if fact.value.count >= 80{
            self.factLabel.font = UIFont(name: "System", size: 17.0)
        } else {
            self.factLabel.font = UIFont(name: "System", size: 20.0)
        }
        
        self.categoryLabel.text = "Teste"
        
    }
}
