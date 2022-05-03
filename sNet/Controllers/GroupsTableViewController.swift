//
//  GroupsTableViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 01.05.2022.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
//    let groups: [Groups] = [
//        Groups(image: "1", name: "Auto", description: "Auto lovers"),
//        Groups(image: "2", name: "Music", description: "Music lovers"),
//        Groups(image: "3", name: "Computers", description: "Comp lovers"),
//        Groups(image: "4", name: "Books", description: "Book lovers"),
//        Groups(image: "5", name: "Cooking", description: "Cooking profi"),
//        Groups(image: "6", name: "Traveling", description: "Travel blogging"),
//        Groups(image: "7", name: "Sport", description: "Prof. sports"),
//        Groups(image: "8", name: "Pets", description: "Pets-Pets-Pets"),
//        Groups(image: "9", name: "Blogging", description: "All about blogging"),
//        Groups(image: "10", name: "Shopping", description: "Find best price"),
//        Groups(image: "11", name: "Art", description: "Painting")
//    ]
    
    let groups: [Groups] = [
        Groups(image: UIImage(named: "1"), name: "Auto", description: "Auto lovers"),
        Groups(image: UIImage(named: "2"), name: "Music", description: "Music lovers"),
        Groups(image: UIImage(named: "3"), name: "Computers", description: "Comp lovers"),
        Groups(image: UIImage(named: "4"), name: "Books", description: "Book lovers"),
        Groups(image: UIImage(named: "5"), name: "Cooking", description: "Cooking profi"),
        Groups(image: UIImage(named: "6"), name: "Traveling", description: "Travel blogging"),
        Groups(image: UIImage(named: "7"), name: "Sport", description: "Prof. sports"),
        Groups(image: UIImage(named: "8"), name: "Pets", description: "Pets-Pets-Pets"),
        Groups(image: UIImage(named: "9"), name: "Blogging", description: "All about blogging"),
        Groups(image: UIImage(named: "10"), name: "Shopping", description: "Find best price"),
        Groups(image: UIImage(named: "11"), name: "Art", description: "Painting")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.groupCell, for: indexPath) as! GroupsTableViewCell

//        var content = cell.defaultContentConfiguration()
//        content.text = "Group1"
//        cell.contentConfiguration = content
        let group = groups[indexPath.row]
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
