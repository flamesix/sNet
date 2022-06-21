//
//  FriendsTableViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 01.05.2022.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    /*
    let friends: [Friends] = [
        Friends(userID: "1", userPhoto: UIImage(named: "g1"), name: "John", lastName: "Johnson", icon: "🤡", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7")),
            PhotosOfFriend(photo: UIImage(named: "7")),
            PhotosOfFriend(photo: UIImage(named: "8")),
            PhotosOfFriend(photo: UIImage(named: "1"))
        ]),
        Friends(userID: "2", userPhoto: UIImage(named: "g2"), name: "Bob", lastName: "Bobson", icon: "😈", photos: [
            PhotosOfFriend(photo: UIImage(named: "2")),
            PhotosOfFriend(photo: UIImage(named: "3")),
            PhotosOfFriend(photo: UIImage(named: "12"))
        ]),
        Friends(userID: "3", userPhoto: UIImage(named: "g3"), name: "Peter", lastName: "Peterson", icon: "🤠", photos: [
            PhotosOfFriend(photo: UIImage(named: "g3")),
            PhotosOfFriend(photo: UIImage(named: "g10")),
            PhotosOfFriend(photo: UIImage(named: "2")),
            PhotosOfFriend(photo: UIImage(named: "4")),
            PhotosOfFriend(photo: UIImage(named: "9")),
            PhotosOfFriend(photo: UIImage(named: "5")),
            PhotosOfFriend(photo: UIImage(named: "1")),
            PhotosOfFriend(photo: UIImage(named: "g1")),
            PhotosOfFriend(photo: UIImage(named: "g2")),
            PhotosOfFriend(photo: UIImage(named: "g4"))
        ]),
        Friends(userID: "4", userPhoto: UIImage(named: "g4"), name: "Rick", lastName: "Rickson", icon: "👻", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7")),
            PhotosOfFriend(photo: UIImage(named: "g7")),
            PhotosOfFriend(photo: UIImage(named: "g7")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "5", userPhoto: UIImage(named: "g5"), name: "Jane", lastName: "Janeson", icon: "😺", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "6", userPhoto: UIImage(named: "g6"), name: "Anna", lastName: "Annenson", icon: "🎃", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7")),
            PhotosOfFriend(photo: UIImage(named: "g3")),
            PhotosOfFriend(photo: UIImage(named: "g10")),
            PhotosOfFriend(photo: UIImage(named: "2")),
            PhotosOfFriend(photo: UIImage(named: "4")),
            PhotosOfFriend(photo: UIImage(named: "9")),
            PhotosOfFriend(photo: UIImage(named: "5")),
            PhotosOfFriend(photo: UIImage(named: "1")),
            PhotosOfFriend(photo: UIImage(named: "g1")),
            PhotosOfFriend(photo: UIImage(named: "g2")),
            PhotosOfFriend(photo: UIImage(named: "g4"))
        ]),
        Friends(userID: "7", userPhoto: UIImage(named: "g7"), name: "Dick", lastName: "Dickson", icon: "👺", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "8", userPhoto: UIImage(named: "g8"), name: "Mary", lastName: "Smith", icon: "🤪", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "9", userPhoto: UIImage(named: "g9"), name: "Helga", lastName: "Morrison", icon: "🧐", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "10", userPhoto: UIImage(named: "g10"), name: "Leonard", lastName: "Cohen", icon: "🥸", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "11", userPhoto: UIImage(named: "1"), name: "Jim", lastName: "Cohen", icon: "🥸", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "12", userPhoto: UIImage(named: "9"), name: "Richard", lastName: "Morrison", icon: "🧐", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "13", userPhoto: UIImage(named: "8"), name: "James", lastName: "Morrison", icon: "🧐", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "14", userPhoto: UIImage(named: "2"), name: "Chloe", lastName: "Richardson", icon: "🧐", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "15", userPhoto: UIImage(named: "3"), name: "Marty", lastName: "Rogers", icon: "🧐", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "16", userPhoto: UIImage(named: "7"), name: "Helmut", lastName: "Henzel", icon: "🧐", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "17", userPhoto: UIImage(named: "g9"), name: "Robert", lastName: "Turnbau", icon: "🧐", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "18", userPhoto: UIImage(named: "4"), name: "Григорий", lastName: "Гришин", icon: "🧐", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ]),
        Friends(userID: "19", userPhoto: UIImage(named: "4"), name: "Вячеслав", lastName: "Юдин", icon: "🧐", photos: [
            PhotosOfFriend(photo: UIImage(named: "g9")),
            PhotosOfFriend(photo: UIImage(named: "g7"))
        ])
    ]
     */
    
    var friends: [Friends] = [] {
        didSet {
            for friend in friends {
                let friendKey = String(friend.lastName.prefix(1))
                if var friendValues = friendsDictionary[friendKey] {
                    friendValues.append(friend)
                    friendsDictionary[friendKey] = friendValues
                } else {
                    friendsDictionary[friendKey] = [friend]
                }
            }
            
            friednsSectionTitles = [String](friendsDictionary.keys)
            friednsSectionTitles = friednsSectionTitles.sorted(by: { $0 < $1 })
            
            self.tableView.reloadData()
            
//            for frined in friends {
//                print(frined.lastName, frined.userID, frined.userPhotoData)
//            }
        }
    }
    
    
    
    var friendsDictionary = [String: [Friends]]()
    var friednsSectionTitles = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService().getInfo(for: 123733, info: .friendList) { [weak self] friendsArray in
            self?.friends = friendsArray

        }
        
     //   print(friends.count)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        for friend in friends {
//            let friendKey = String(friend.lastName.prefix(1))
//            if var friendValues = friendsDictionary[friendKey] {
//                friendValues.append(friend)
//                friendsDictionary[friendKey] = friendValues
//            } else {
//                friendsDictionary[friendKey] = [friend]
//            }
//        }
//
//        friednsSectionTitles = [String](friendsDictionary.keys)
//        friednsSectionTitles = friednsSectionTitles.sorted(by: { $0 < $1 })
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // return 1
        return friednsSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //  return friends.count
        let friendKey = friednsSectionTitles[section]
        if let friendValues = friendsDictionary[friendKey] {
            return friendValues.count
        }
        
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.friendCell, for: indexPath) as?  FriendsTableViewCell else { preconditionFailure("Error") }
        
        let friendKey = friednsSectionTitles[indexPath.section]
        //        let friend = friends[indexPath.row]
        //        cell.updateFriendsTable(with: friend)
        if let friendValues = friendsDictionary[friendKey] {
            let friend = friendValues[indexPath.row]
            cell.updateFriendsTable(with: friend)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //        cell.transform = CGAffineTransform(translationX: 0, y: cell.contentView.frame.height)
        //        UIView.animate(withDuration: 2, delay: 0.05 * Double(indexPath.row), animations: {
        //              cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
        //        })
        
        cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width / 8, y: 0)
        UIView.animate(
            withDuration: 1,
            delay: 0.05 * Double(indexPath.row),
            options: [.curveEaseInOut],
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friednsSectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friednsSectionTitles
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
            let friendKey = friednsSectionTitles[indexPath.section]
            //        let friend = friends[indexPath.row]
            //        cell.updateFriendsTable(with: friend)
            if let friendValues = friendsDictionary[friendKey] {
                let friend = friendValues[indexPath.row]
                
              //  let friendName = friend.name
                let friendName = friend.firstName
                collectionVC.friends.append(friend)
//                collectionVC.photos = friend.photos
                collectionVC.title = "\(friendName)'s photos"
                collectionVC.friendID = friend.userID
            }
            //            let friend = friends[indexPath.row]
            //            let friendName = friends[indexPath.row].name
            //            collectionVC.friends.append(friend)
            //            collectionVC.title = friendName
            
        }
    }
    
    
}
