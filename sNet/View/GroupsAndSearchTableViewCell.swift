//
//  GroupsAndSearchTableViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 19.05.2022.
//

import UIKit
import Kingfisher

class GroupsAndSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupDescriptionLabel: UILabel!
    
    
//    func updateGroupsTable(with searchGroup: Groups) {
//        groupImage.image = searchGroup.image
//        groupNameLabel.text = searchGroup.name
//        groupDescriptionLabel.text = searchGroup.description
//    }
    
    func updateGroupsTable(with searchGroup: Groups) {
       // groupImage.image = searchGroup.image
        groupNameLabel.text = searchGroup.groupName
     //   groupDescriptionLabel.text = searchGroup.groupDescription
        groupDescriptionLabel.text = ""
        
        if let url = URL(string: searchGroup.groupsPhotoData) {
//            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
//                if let data = data {
//                    DispatchQueue.main.async {
//                        searchGroup.groupsPhoto = UIImage(data: data) ?? #imageLiteral(resourceName: "g3")
//                        self.groupImage.image = searchGroup.groupsPhoto
//                    }
//                }
//            }.resume()
            self.groupImage.kf.setImage(with: url)
        }
    }
    
//    func updateSearchGroupTable(with group: Groups) {
//        groupImage.image = group.image
//        groupNameLabel.text = group.name
//        groupDescriptionLabel.text = group.description
//    }
    
    func updateSearchGroupTable(with group: Groups) {
       // groupImage.image = group.image
        groupNameLabel.text = group.groupName
//        groupDescriptionLabel.text = group.groupDescription
        groupDescriptionLabel.text = ""
        
        if let url = URL(string: group.groupsPhotoData) {
//            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
//                if let data = data {
//                    DispatchQueue.main.async {
//                        group.groupsPhoto = UIImage(data: data) ?? #imageLiteral(resourceName: "g3")
//                        self.groupImage.image = group.groupsPhoto
//                    }
//                }
//            }.resume()
            self.groupImage.kf.setImage(with: url)
        }
    }
}
