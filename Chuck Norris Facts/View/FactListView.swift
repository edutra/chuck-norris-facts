//
//  FactListView.swift
//  Chuck Norris Facts
//
//  Created by Enrique Dutra on 30/03/21.
//

import UIKit
import Foundation

class FactListView: UIViewController{
    
    fileprivate let viewModel = FactListViewModel()
    fileprivate var loadingError = false
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    let spinner = UIActivityIndicatorView(style: .medium)

        
    
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.searchBar.delegate = self
        self.viewModel.delegate = self
        
        setLoading()
        
        
        
        
    }
    
}

// MARK: - Table View Delegate e Data Source
extension FactListView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    // TODO: Implementação e design da celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.loadingError {
        case true:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "fetchErrorCell") as? ErrorTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: "Nenhum resultado foi encontrado.")
            
            return cell
        default:
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as? FactListTableViewCell else {
                return UITableViewCell()
            }
            
            guard let facts = self.viewModel.facts else {return UITableViewCell()}
            cell.configure(with: facts[indexPath.section])
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        // Caso não tenha encontrado nenhum fato não tem por que ser selecionável
        if self.loadingError {
            return
        }
        if let fact = self.viewModel.facts?[indexPath.row] {
            let textToShare = fact.value

            if let url = fact.url {
                let objectsToShare = [textToShare, url] as [Any]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

                        
                activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]

                self.present(activityVC, animated: true, completion: nil)
            }
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let count = self.viewModel.facts?.count else {return 0}
        
        if count > 0 {
            return count
        } else {
            return 1
        }
    }
    
    
}


// MARK: - Search Bar Delegate

extension FactListView: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.count > 2) && (searchText.count < 121){
            self.viewModel.fetchFacts(by: searchText)
            self.startLoading()
            
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return}
        if (searchText.count > 2) && (searchText.count < 121){
            self.viewModel.fetchFacts(by: searchText)
            self.startLoading()
            
        }
    }
}
// MARK: - Fact List View Model Delegate
extension FactListView: FactListViewModelDelegate{
    func didFetchFacts() {
        self.loadingError = false
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.stopLoading()
        }
    }
    
    
    
    func fetchError() {
        self.loadingError = true
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.stopLoading()
        }
        
    }
    
    
}
// MARK: - LoadingScreen

extension FactListView{

    func setLoading(){
        self.tableView.backgroundView = self.spinner
        self.view.addSubview(self.spinner)
        
    }
    func startLoading(){
        self.spinner.startAnimating()
        
    }
    func stopLoading(){
        self.spinner.stopAnimating()
        
    }

}
