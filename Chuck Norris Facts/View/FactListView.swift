//
//  FactListView.swift
//  Chuck Norris Facts
//
//  Created by Enrique Dutra on 30/03/21.
//

import UIKit
import Foundation

class FactListView: UIViewController{
    
    let viewModel = FactListViewModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.searchBar.delegate = self
        self.viewModel.delegate = self
        
        
    }
    
}

// MARK: - Table View Delegate e Data Source
extension FactListView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = self.viewModel.facts?.count else {return 0}
        return count
    }
    // TODO: Implementação e design da celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as? FactListTableViewCell else {
            return UITableViewCell()
        }
        
        guard let facts = self.viewModel.facts else {return UITableViewCell()}
        cell.configure(with: facts[indexPath.row])
        
        return cell
    }
    
    
}


// MARK: - Search Bar Delegate
// TODO: Implementar métodos da search bar delegate
extension FactListView: UISearchBarDelegate{
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if (searchText.count > 2) && (searchText.count < 121){
            self.viewModel.fetchFacts(by: searchText)
            
        }
        
    }
}
