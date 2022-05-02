//
//  FriendsTableViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 02.05.2022.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateFriendsTable(with friend: Friends) {
        iconLabel.text = friend.icon
        nameLabel.text = friend.name + " " + friend.lastName
    }

}
