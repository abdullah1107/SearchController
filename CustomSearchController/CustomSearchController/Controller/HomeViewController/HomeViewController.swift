//  HomeViewController.swift
//  CustomSearchController
//  Created by Muhammad Abdullah Al Mamun on 21/12/19.
//  Copyright © 2019 Muhammad Abdullah Al Mamun. All rights reserved.

import UIKit

class HomeViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate{
    
    
    
    @IBOutlet var customtableView: UITableView!
    var personData = [Person]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customtableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        customtableView.dataSource = self
        customtableView.delegate = self
        searchBarSetup()
        DataModelSetUP()
        
        // Do any additional setup after loading the view.
    }
    
    func searchBarSetup(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    func DataModelSetUP(){
        personData = [
            Person(firstName:"abdullah", lastName: "mamun", contact: ""),
            Person(firstName:"GolamAzam", lastName: "badon", contact: ""),
            Person(firstName: "Abusayed",lastName:  "Babu", contact: ""),
            Person(firstName: "Raiyan", lastName: "Chowdry",contact: ""),
            Person(firstName: "Nazrul", lastName: "islam",contact: ""),
            Person(firstName: "Apurbo", lastName: "islam", contact: ""),
            Person(firstName: "Shawon", lastName: "Chowdory",contact: ""),
            Person(firstName: "Shovon", lastName: "khan",contact: ""),
            Person(firstName: "Mahmud", lastName: "shisab",contact: ""),
            Person(firstName: "Maruf", lastName: "Shakil",contact: "")
        ]
    }
    
    
}

extension HomeViewController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        // later
        guard let searchText = searchController.searchBar.text else { return }
        if searchText == ""{
            DataModelSetUP()
            
        }else{
            DataModelSetUP()
            personData = personData.filter{
                $0.firstName!.contains(searchText)
            }
            
        }
        
        customtableView.reloadData()
    }
    
}



extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = personData[indexPath.row].firstName
        cell.detailTextLabel?.text = personData[indexPath.row].lastName
        return cell
    }
    
}

