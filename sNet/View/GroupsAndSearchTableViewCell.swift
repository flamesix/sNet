//
//  GroupsAndSearchTableViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 19.05.2022.
//

import UIKit

class GroupsAndSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupDescriptionLabel: UILabel!
    
    
    func updateGroupsTable(with searchGroup: Groups) {
        groupImage.image = searchGroup.image
        groupNameLabel.text = searchGroup.name
        groupDescriptionLabel.text = searchGroup.description
    }
    
    func updateSearchGroupTable(with group: Groups) {
        groupImage.image = group.image
        groupNameLabel.text = group.name
        groupDescriptionLabel.text = group.description
    }
}
