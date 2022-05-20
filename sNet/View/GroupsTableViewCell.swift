//
//  GroupsTableViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 03.05.2022.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func updateGroupsTable(with searchGroup: Groups) {
//        groupImage.image = searchGroup.image
//        groupNameLabel.text = searchGroup.name
//        groupDescriptionLabel.text = searchGroup.description
//    }

}
