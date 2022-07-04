//
//  GroupsTableViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 01.05.2022.
//

import UIKit
import RealmSwift

class GroupsTableViewController: UITableViewController {
    
    @IBOutlet weak var groupsSearchBar: UISearchBar! {
        didSet {
            groupsSearchBar.delegate = self
        }
    }

    private let netwotkService = NetworkService()
    private var notificationToken: NotificationToken?
    
    deinit {
        notificationToken?.invalidate()
    }
    
    var groupsData: Results<Groups>?
    
    var groups: [Groups] = [] {
        didSet {
            searchedGroups = groups
            tableView.reloadData()
        }
    }
    
    var searchedGroups: [Groups] = []
    var deletedItem: Groups?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        netwotkService.getGroupsInfo(for: 800500, info: .groupsList)
        getGroupsDataFromRealm()
        observeGroupsData()
        
//        self.setupHideKeyboardOnTap()
       // searchedGroups = groups
        
        tableView.register(UINib(nibName: PropertyKeys.groupsAndSearchTableViewCell, bundle: nil), forCellReuseIdentifier: PropertyKeys.groupsAndSearchTableViewCell)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    ///Get groups from Realm DB
    private func getGroupsDataFromRealm() {
        do {
           let realm = try Realm()
           groupsData = realm.objects(Groups.self)
            if let groupsData = groupsData {
                groups = Array(groupsData)
            }
        } catch {
            print(error)
        }
    }
    
    ///Notification from Realm DB
    private func observeGroupsData() {
        notificationToken = groupsData?.observe { [weak self] change in
            switch change {
            case .initial:
                self?.tableView.reloadData()
            case let .update(_, deletions, insertions, modifications):
                self?.tableView.reloadData()
            case .error(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return groups.count
        return searchedGroups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.groupsAndSearchTableViewCell, for: indexPath) as? GroupsAndSearchTableViewCell else { preconditionFailure("Error") }
        
        // let group = groups[indexPath.row]
        let group = searchedGroups[indexPath.row]
        cell.updateGroupsTable(with: group)
        
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
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deletedItem = searchedGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
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
    
    
    // MARK: - Navigation
    
    //    @IBAction func goToSearchTableViewController(_ sender: UIBarButtonItem) {
    ////        performSegue(withIdentifier: PropertyKeys.goToSearchTableViewController, sender: sender)
    //        print("TEST -----------------------------------------------------------")
    ////        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    ////        let editScreen = storyboard.instantiateViewController(withIdentifier: PropertyKeys.searchTableViewController) as! SearchTableViewController
    ////        editScreen.updatingData = deletedItem!
    //
    //
    //    }
    
    /*
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     segue.destination
     // Pass the selected object to the new view controller.
     }
     */
    
    //    @IBAction func goTo(_ sender: UIBarButtonItem) {
    //        performSegue(withIdentifier: PropertyKeys.goToSearchTableViewController, sender: sender)
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //        let editScreen = storyboard.instantiateViewController(withIdentifier: PropertyKeys.searchTableViewController) as! SearchTableViewController
    //
    //        editScreen.updatingData = deletedItem
    //
    //
    //    }
    @IBAction func unwindToGroupsTableViewController(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? SearchTableViewController,
           let indexPath = sourceViewController.tableView.indexPathForSelectedRow {
            let groupToAdd = sourceViewController.filteredGroups[indexPath.row]
            if !searchedGroups.contains(where: {$0.groupName == groupToAdd.groupName}) {
                searchedGroups.append(groupToAdd)
                tableView.reloadData()
            }
        }
    }
}

// MARK: - SearchBarDelegate

extension GroupsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchedGroups = groups
        } else {
            searchedGroups = groups.filter { $0.groupName.localizedCaseInsensitiveContains(searchText) }
        }
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.searchTextField.transform = CGAffineTransform(translationX: searchBar.frame.width, y: 0)
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: []) {
            searchBar.searchTextField.transform = CGAffineTransform(translationX: 0, y: 0)
        } completion: { _ in
            self.groupsSearchBar.showsCancelButton = true
        }

        
    }
    
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        groupsSearchBar.searchTextField.text = ""
        searchedGroups = groups
        groupsSearchBar.showsCancelButton = false
        setupHideKeyboardOnTap()
        tableView.reloadData()
    }
    
}
