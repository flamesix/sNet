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
    
    func updateGroupsTable(with group: Groups) {
        groupImage.image = group.image
        groupNameLabel.text = group.name
        groupDescriptionLabel.text = group.description
    }

}
