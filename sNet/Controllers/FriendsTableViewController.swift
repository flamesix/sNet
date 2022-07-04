//
//  FriendsTableViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 01.05.2022.
//

import UIKit
import RealmSwift

class FriendsTableViewController: UITableViewController {
    
    private let netwotkService = NetworkService()
    private var notificationToken: NotificationToken?
    
    deinit {
        notificationToken?.invalidate()
    }
    
//    var friends: [Friends] = [] {
//        didSet {
//            for friend in friends {
//                let friendKey = String(friend.lastName.prefix(1))
//                if var friendValues = friendsDictionary[friendKey] {
//                    friendValues.append(friend)
//                    friendsDictionary[friendKey] = friendValues
//                } else {
//                    friendsDictionary[friendKey] = [friend]
//                }
//            }
//
//            friednsSectionTitles = [String](friendsDictionary.keys)
//            friednsSectionTitles = friednsSectionTitles.sorted(by: { $0 < $1 })
//
//            self.tableView.reloadData()
//
//        }
//    }
    
    
    
    var friendsDictionary = [String: [Friends]]()
    var friednsSectionTitles = [String]()
    
    var friendsData: Results<Friends>? {
        didSet {
            guard let friendsData = friendsData else {
                return
            }
            for friend in friendsData {
                let friendKey = String(friend.lastName.prefix(1))
                if var friendValues = friendsDictionary[friendKey] {
                    friendValues.append(friend)
                    friendsDictionary[friendKey] = friendValues
                } else {
                    friendsDictionary[friendKey] = [friend]
                }
                
                friednsSectionTitles = [String](friendsDictionary.keys)
                friednsSectionTitles = friednsSectionTitles.sorted(by: { $0 < $1 })
                
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        netwotkService.getFiendsInfo(for: 123733, info: .friendList)
        getFriendsDataFromRealm()
        observeFriendsData()
    }
    
    ///Get friends from Realm DB
    private func getFriendsDataFromRealm() {
        do {
//                        var config = Realm.Configuration.defaultConfiguration
//                        config.deleteRealmIfMigrationNeeded = true
            let realm = try Realm()
         //   print(realm.configuration.fileURL)
            friendsData = realm.objects(Friends.self)
//            if let friendsData = friendsData {
//                friends = Array(friendsData)
//            }
        } catch {
            print(error)
        }
    }
    
    
    
    ///Notification from Realm DB
    private func observeFriendsData() {
        notificationToken = friendsData?.observe { [weak self] change in
            switch change {
            case .initial:
                self?.tableView.reloadData()
            case let .update(_, deletions, insertions, modifications):
                print(deletions, insertions, modifications)
                self?.tableView.performBatchUpdates {
                    guard let friendsData = self?.friendsData else { return }

                    self?.tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: (self?.friednsSectionTitles.firstIndex(of: String(friendsData[$0].lastName.prefix(1)))!)!)}, with: .automatic)
                    self?.tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: (self?.friednsSectionTitles.firstIndex(of: String(friendsData[$0].lastName.prefix(1)))!)!)}, with: .automatic)
                    self?.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: (self?.friednsSectionTitles.firstIndex(of: String(friendsData[$0].lastName.prefix(1)))!)!)}, with: .automatic)
                }
                self?.tableView.reloadData()
            case .error(let error):
                print(error)
            }
        }
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
