//
//  PhotosViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 28.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var secondaryImageView: UIImageView!
    
    var photos: [PhotosOfFriend] = []
    
    private var propertyAnimator: UIViewPropertyAnimator = {
        return UIViewPropertyAnimator(duration: 1, curve: .easeInOut)
    }()
    
    enum AnimationDirection {
        case left
        case right
        
        var direction: CGFloat {
            switch self {
            case .left:
                return 1
            case .right:
                return -1
            }
        }
        
        var index: Int {
            switch self {
            case .left:
                return 1
            case .right:
                return -1
            }
        }
    }
    
    private var animationDirection: AnimationDirection = .left
    public var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard !photos.isEmpty else { return }
        mainImageView.image = photos[currentIndex].photo
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        view.addGestureRecognizer(panGesture)
        
    }
    
    @objc func panned(_ panGesture: UIPanGestureRecognizer) {
        
        switch panGesture.state {
            
        case .began:
            
            if panGesture.translation(in: view).x > 0 {
                //right
                guard currentIndex >= 1 else { return }
                animate(animation: .right)
                //                propertyAnimator.addAnimations {
                //                    self.animate(animation: .right)
                //                }
                
                //                propertyAnimator.startAnimation()
                //                propertyAnimator.pauseAnimation()
                // animate(animation: .right)
                
                //                secondaryImageView.image = photos[currentIndex - 1].photo
                //                secondaryImageView.transform = CGAffineTransform(translationX: -1.2 * secondaryImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
                //                mainImageView.transform = CGAffineTransform(translationX: 1.2 * mainImageView.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
                //                currentIndex -= 1
                //                mainImageView.image = photos[currentIndex].photo
                //                mainImageView.transform = .identity
                //                secondaryImageView.image = nil
                
            } else {
                //left
                guard currentIndex + 1 < photos.count else { return }
                animate(animation: .left)
                
                
                
                //                secondaryImageView.image = photos[currentIndex + 1].photo
                //                secondaryImageView.transform = CGAffineTransform(translationX: 1.2 * secondaryImageView.bounds.width, y: 200).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
                //                mainImageView.transform = CGAffineTransform(translationX: -1.2 * mainImageView.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
                //                currentIndex += 1
                //                mainImageView.image = photos[currentIndex].photo
                //                mainImageView.transform = .identity
                //                secondaryImageView.image = nil
            }
            
        case .changed:
            print("changed")
        case .ended:
            print("ended")
            
        case .possible:
            break
        case .cancelled:
            break
        case .failed:
            break
        @unknown default:
            break
        }
        
        
    }
    
    private func animate(animation: AnimationDirection) {
        
        secondaryImageView.image = photos[currentIndex + animation.index].photo
        secondaryImageView.transform = CGAffineTransform(translationX: animation.direction * secondaryImageView.bounds.width, y: 200)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseInOut) { [self] in
            
            mainImageView.transform = CGAffineTransform(translationX: -1.2 * animation.direction * mainImageView.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
            
            secondaryImageView.transform = .identity
            
        } completion: { [self] _ in
            currentIndex = currentIndex + animation.index
            mainImageView.image = photos[currentIndex].photo
            mainImageView.transform = .identity
            secondaryImageView.image = nil
        }
    }
}
