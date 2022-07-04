//
//  CollectionViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 02.05.2022.
//

import UIKit
import RealmSwift

private let reuseIdentifier = PropertyKeys.photoCollection

class CollectionViewController: UICollectionViewController {
    
    private let netwotkService = NetworkService()
    private var notificationToken: NotificationToken?
    
    deinit {
        notificationToken?.invalidate()
    }
    
    var friendID: Int = 0
    var friends: [Friends] = []
    var photos: [PhotosOfFriend] = []
    var photosNetwork: [Photos] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var photosData: Results<Photos>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        netwotkService.getPhotosInfo(for: friendID, info: .photosList)
        getPhotosDataFromRealm()
        observePhotosData()
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

    ///Get photos from Realm DB
    private func getPhotosDataFromRealm() {
        do {
            let realm = try Realm()
            photosData = realm.objects(Photos.self)
            if let photosData = photosData {
                photosNetwork = Array(photosData)
               // print(realm.configuration.fileURL)
            }
        } catch {
            print(error)
        }
    }
    
    ///Notification from Realm DB
    private func observePhotosData() {
        notificationToken = photosData?.observe { [weak self] change in
            switch change {
            case .initial:
                self?.collectionView.reloadData()
            case let .update(_, deletions, insertions, modifications):
                self?.collectionView.performBatchUpdates {
                    self?.collectionView.deleteItems(at: deletions.map { IndexPath(item: $0, section: 0) })
                    self?.collectionView.insertItems(at: insertions.map { IndexPath(item: $0, section: 0) })
                    self?.collectionView.reloadItems(at: modifications.map { IndexPath(item: $0, section: 0) })
                }
                self?.collectionView.reloadData()
            case .error(let error):
                print(error)
            }
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // return friends.count
      //  return photos.count
        return photosData?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as?  CollectionViewCell else { preconditionFailure("Error") }
    
//        guard let friend = friends.first else { preconditionFailure("Error") }
//        cell.updatePhoto(with: friend)
//        let photo = photos[indexPath.item]
//        cell.updatePhoto(with: photo, with: friend)
        guard let photo = photosData?[indexPath.item] else { return cell }
        cell.updatePhoto(with: photo)
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: PropertyKeys.showPhotosSegue, sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == PropertyKeys.showPhotosSegue,
           let photosVC = segue.destination as? PhotosViewController {

            let selectedPhoto = collectionView.indexPathsForSelectedItems?.first
//            photosVC.photos = photos
            guard let photosData = photosData else {
                return
            }

            photosVC.photos = Array(photosData)
            photosVC.currentIndex = selectedPhoto?.item ?? 0
        }
           
    }

}
