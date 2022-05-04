//
//  SearchGroupTableViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 03.05.2022.
//

import UIKit

class SearchGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchGroupLabel: UILabel!
    @IBOutlet weak var searchDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func updateSearchGroupTable(with group: Groups) {
        searchImage.image = group.image
        searchGroupLabel.text = group.name
        searchDescriptionLabel.text = group.description
    }

}
