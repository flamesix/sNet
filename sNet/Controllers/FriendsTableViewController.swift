//
//  FriendsTableViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 01.05.2022.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    
    
    let friends: [Friends] = [
        Friends(userPhoto: UIImage(named: "1"), name: "John", lastName: "Johnson", icon: "🤡"),
        Friends(userPhoto: UIImage(named: "2"), name: "Bob", lastName: "Bobson", icon: "😈"),
        Friends(userPhoto: UIImage(named: "3"), name: "Peter", lastName: "Peterson", icon: "🤠"),
        Friends(userPhoto: UIImage(named: "4"), name: "Rick", lastName: "Rickson", icon: "👻"),
        Friends(userPhoto: UIImage(named: "5"), name: "Jane", lastName: "Janeson", icon: "😺")
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.friendCell, for: indexPath) as?  FriendsTableViewCell else { preconditionFailure("Error") }
        
        let friend = friends[indexPath.row]
        cell.updateFriendsTable(with: friend)
        
        
        return cell
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PropertyKeys.friendToPhotoCollectionSegue,
           let collectionVC = segue.destination as? CollectionViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let friend = friends[indexPath.row]
            let friendName = friends[indexPath.row].name
            collectionVC.friends.append(friend)
            collectionVC.title = friendName
            
        }
    }
    
    
}
