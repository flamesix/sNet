//
//  SearchTableViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 02.05.2022.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController()
    
    @IBOutlet weak var searchField: UISearchBar!
    
    var searchGroups: [Groups] = [
        Groups(image: UIImage(named: "12"), name: "iOS", description: "iOS lovers"),
        Groups(image: UIImage(named: "13"), name: "Android", description: "Android lovers")
    ]
    
    var filteredGroups: [Groups] = []
    
    var updatingData: Groups?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        
        updateSearchResults(for: searchController)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
       // updateDataFromGroup(with: updatingData!)
       // print(updatingData)
    }
    
    func updateDataFromGroup(with group: Groups) {
        searchGroups.append(group)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchString = searchController.searchBar.text,
           !searchString.isEmpty {
            filteredGroups = searchGroups.filter { (item) -> Bool in
                item.name.localizedCaseInsensitiveContains(searchString)
            }
        } else {
            filteredGroups = searchGroups
        }
        tableView.reloadData()
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return searchGroups.count
        return filteredGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.searchGroup, for: indexPath) as? SearchGroupTableViewCell else { preconditionFailure("Error") }

       // let searchGroup = searchGroups[indexPath.row]
        let searchGroup = filteredGroups[indexPath.row]
        cell.updateSearchGroupTable(with: searchGroup)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
