//
//  FactListView.swift
//  Chuck Norris Facts
//
//  Created by Enrique Dutra on 30/03/21.
//

import UIKit


class FactListView: UIViewController{
    
    let viewModel = FactListViewModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.searchBar.delegate = self
        
        
    }
    
}

// MARK: - Table View Delegate e Data Source
extension FactListView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.facts!.count
    }
    // TODO: Implementação e design da celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


// MARK: - Search Bar Delegate
// TODO: Implementar métodos da search bar delegate
extension FactListView: UISearchBarDelegate{
    
}
