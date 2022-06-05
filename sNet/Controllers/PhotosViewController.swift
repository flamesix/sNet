//
//  PhotosViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 28.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet weak var photosView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var secondaryImageView: UIImageView!
    
    var photos: [PhotosOfFriend] = []
    
    private var propertyAnimator: UIViewPropertyAnimator?
    
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
    
    private var animationDirection: AnimationDirection?
    public var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard !photos.isEmpty else { return }
        mainImageView.image = photos[currentIndex].photo
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned))
        view.addGestureRecognizer(panGesture)
        
    }
    
    @objc func panned(_ panGesture: UIPanGestureRecognizer) {
        switch panGesture.state {
            
        case .began:
            if panGesture.translation(in: view).x > 0 {
                guard currentIndex >= 1 else { return }
                animateWithPropertyAnimator(animation: .right)
                animationDirection = .right
                
            } else {
                guard currentIndex + 1 < photos.count else { return }
                animateWithPropertyAnimator(animation: .left)
                animationDirection = .left
            }
        case .changed:
            switch animationDirection {
            case .left:
                //guard propertyAnimator != nil else { return }
                let percent = min(max(0, -panGesture.translation(in: view).x / 200), 1)
                propertyAnimator?.fractionComplete = percent
                
            case .right:
                
                let percent = min(max(0, panGesture.translation(in: view).x / 200), 1)
                propertyAnimator?.fractionComplete = percent
                
            case .none:
                if panGesture.translation(in: view).x > 0 {
                    animationDirection = .right
                } else {
                    animationDirection = .left
                }
            }
        case .ended:
            if propertyAnimator?.fractionComplete ?? 0 > 0.4 {
                propertyAnimator?.continueAnimation(withTimingParameters: nil, durationFactor: 0.2)
            } else {
                propertyAnimator?.isReversed = true
                propertyAnimator?.continueAnimation(withTimingParameters: nil, durationFactor: 0.2)
            }
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
    
    private func animateWithPropertyAnimator(animation: AnimationDirection) {
        
        //Setting secondaryImageView to initial state
        secondaryImageView.transform = CGAffineTransform(translationX: animation.direction * secondaryImageView.bounds.width, y: 200).concatenating(.init(scaleX: 1.2, y: 1.2))
        
        secondaryImageView.image = photos[currentIndex + animation.index].photo
        
        //Animation
        propertyAnimator = UIViewPropertyAnimator(duration: 1,
                                                  curve: .easeInOut,
                                                  animations: { [self] in
            
            mainImageView.transform = CGAffineTransform(translationX: -animation.direction * mainImageView.bounds.width, y: -100).concatenating(.init(scaleX: 0.6, y: 0.6))
            secondaryImageView.transform = .identity
        })
        
        propertyAnimator?.addCompletion { [self] position in
            switch position {
            case .end:
                currentIndex = currentIndex + animation.index
                mainImageView.image = photos[currentIndex].photo
                mainImageView.transform = .identity
                secondaryImageView.image = nil
            case .start:
                secondaryImageView.transform = CGAffineTransform(translationX: -animation.direction * secondaryImageView.bounds.width, y: 200).concatenating(.init(scaleX: 1.2, y: 1.2))
            case .current:
                break
            @unknown default:
                break
            }
        }
    }
}
