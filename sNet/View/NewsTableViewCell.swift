//
//  NewsTableViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 15.05.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let friends: [Friends] = [
//        Friends(userID: "1", userPhoto: UIImage(named: "g1"), name: "John", lastName: "Johnson", icon: "🤡"),
//        Friends(userID: "2", userPhoto: UIImage(named: "g2"), name: "Bob", lastName: "Bobson", icon: "😈"),
//        Friends(userID: "3", userPhoto: UIImage(named: "g3"), name: "Peter", lastName: "Peterson", icon: "🤠"),
//        Friends(userID: "4", userPhoto: UIImage(named: "g4"), name: "Rick", lastName: "Rickson", icon: "👻"),
//        Friends(userID: "5", userPhoto: UIImage(named: "g5"), name: "Jane", lastName: "Janeson", icon: "😺"),
//        Friends(userID: "6", userPhoto: UIImage(named: "g6"), name: "Anna", lastName: "Annenson", icon: "🎃"),
//        Friends(userID: "7", userPhoto: UIImage(named: "g7"), name: "Dick", lastName: "Dickson", icon: "👺"),
//        Friends(userID: "8", userPhoto: UIImage(named: "g8"), name: "Mary", lastName: "Smith", icon: "🤪"),
//        Friends(userID: "9", userPhoto: UIImage(named: "g9"), name: "Helga", lastName: "Morrison", icon: "🧐"),
//        Friends(userID: "10", userPhoto: UIImage(named: "g10"), name: "Leonard", lastName: "Cohen", icon: "🥸"),
//        Friends(userID: "11", userPhoto: UIImage(named: "1"), name: "Jim", lastName: "Cohen", icon: "🥸"),
//        Friends(userID: "12", userPhoto: UIImage(named: "9"), name: "Richard", lastName: "Morrison", icon: "🧐"),
//        Friends(userID: "13", userPhoto: UIImage(named: "8"), name: "James", lastName: "Morrison", icon: "🧐"),
//        Friends(userID: "14", userPhoto: UIImage(named: "2"), name: "Chloe", lastName: "Richardson", icon: "🧐"),
//        Friends(userID: "15", userPhoto: UIImage(named: "3"), name: "Marty", lastName: "Rogers", icon: "🧐"),
//        Friends(userID: "16", userPhoto: UIImage(named: "7"), name: "Helmut", lastName: "Henzel", icon: "🧐"),
//        Friends(userID: "17", userPhoto: UIImage(named: "g9"), name: "Robert", lastName: "Turnbau", icon: "🧐"),
//        Friends(userID: "18", userPhoto: UIImage(named: "4"), name: "Григорий", lastName: "Гришин", icon: "🧐"),
//        Friends(userID: "19", userPhoto: UIImage(named: "4"), name: "Вячеслав", lastName: "Юдин", icon: "🧐")
    ]
    
    @IBOutlet var newsCollectionView: UICollectionView!
    
    @IBOutlet weak var userPhotoView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userPhotoImage: UIImageView!
    @IBOutlet weak var timeCreatedLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var repostButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.newsCollectionView.dataSource = self
        self.newsCollectionView.delegate = self
        self.newsCollectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PropertyKeys.newsCollectionViewCell)

      
        
        userPhotoView.layer.cornerRadius = userPhotoView.frame.size.width / 2
        userPhotoImage.layer.cornerRadius = userPhotoImage.frame.size.width / 2
        userPhotoView.layer.shadowRadius = userPhotoImage.frame.size.width / 2
        userPhotoView.layer.shadowColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        userPhotoView.layer.shadowOpacity = 0.7
        
        
        changeButtonView(button: repostButton)
        changeButtonView(button: chatButton)
        changeButtonView(button: likeButton)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func changeButtonView(button: UIButton) {
        button.layer.cornerRadius = button.frame.size.width / 6
        button.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PropertyKeys.newsCollectionViewCell, for: indexPath) as? NewsCollectionViewCell else { preconditionFailure("Error")}
        
        let friend = friends[indexPath.item]
        cell.updateNewsCollectionViewCell(with: friend)
        
        return cell
    }
    
    
    
}
