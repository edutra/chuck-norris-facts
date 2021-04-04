//
//  errorTableViewCell.swift
//  Chuck Norris Facts
//
//  Created by Enrique Dutra on 04/04/21.
//

import Foundation
import UIKit

class ErrorTableViewCell: UITableViewCell{
    
    @IBOutlet weak var errorLabel: UILabel!
    
    func configure(with text: String){
        self.selectionStyle = .none
        self.errorLabel.text = text
    }
    
    
}
