//
//  CollectionViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 02.05.2022.
//

import UIKit

private let reuseIdentifier = PropertyKeys.photoCollection

class CollectionViewController: UICollectionViewController {
    
    static var numberOfLikes: Int = 0
    
    var friendID: Int = 0
    var friends: [Friends] = []
    var photos: [PhotosOfFriend] = []
    var photosNetwork: [Photos] = [] {
        didSet {
            for item in photosNetwork {
                CollectionViewController.numberOfLikes = item.likesCount
               // print(item.photoDict)
            }
            self.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService().getPhotosInfo(for: friendID, info: .photosList) { [weak self] photosArray in
            self?.photosNetwork = photosArray
        }
//        NetworkService().getInfoWithURLSession(for: 123733, info: .photosList)
//        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .fractionalHeight(1)))
//
//        let group = NSCollectionLayoutGroup.horizontal(
//            layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1),
//                heightDimension: .absolute(70)),
//            subitem: item,
//            count: 1)
//
//        let section = NSCollectionLayoutSection(group: group)
//
//        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: section)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // return friends.count
      //  return photos.count
        return photosNetwork.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as?  CollectionViewCell else { preconditionFailure("Error") }
    
//        guard let friend = friends.first else { preconditionFailure("Error") }
//        cell.updatePhoto(with: friend)
//        let photo = photos[indexPath.item]
//        cell.updatePhoto(with: photo, with: friend)
        let photo = photosNetwork[indexPath.item]
        cell.updatePhoto(with: photo)
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: PropertyKeys.showPhotosSegue, sender: nil)
    }
    

    // MARK: UICollectionViewDelegate


    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == PropertyKeys.showPhotosSegue,
           let photosVC = segue.destination as? PhotosViewController {

            let selectedPhoto = collectionView.indexPathsForSelectedItems?.first
//            photosVC.photos = photos
            photosVC.photos = photosNetwork
            photosVC.currentIndex = selectedPhoto?.item ?? 0
        }
           
    }

}
