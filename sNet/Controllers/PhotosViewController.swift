//
//  PhotosViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 28.05.2022.
//

import UIKit

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

class PhotosViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var secondaryImageView: UIImageView!
    
    var photos: [PhotosOfFriend] = []
    
    private lazy var panGesture: UIPanGestureRecognizer = {
        let recognizer = UIPanGestureRecognizer()
        recognizer.addTarget(self, action: #selector(panned(_:)))
        return recognizer
        
    }()
    
    private var propertyAnimator: UIViewPropertyAnimator = {
        return UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut)
    }()
    
    private var animationDirection: AnimationDirection = .left
    public var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard !photos.isEmpty else { return }
        mainImageView.image = photos[currentIndex].photo
        
        view.addGestureRecognizer(panGesture)
        
    }
    
    @objc func panned(_ panGesture: UIPanGestureRecognizer) {
        
        let translation = panGesture.translation(in: view).x
        let relativeTranslation = translation / 200
        
        switch panGesture.state {
            
        case .began:
            if translation > 0 {
                print("began panGesture")
                guard currentIndex >= 1 else { return }
                animationDirection = .right
                
                animationWithPropertyAnimator(animation: .right)
                // animate(animation: .right)
                
                
            } else {
                guard currentIndex + 1 < photos.count else { return }
                animationDirection = .left
                animationWithPropertyAnimator(animation: .left)
            }
            
        case .changed:
            
            switch animationDirection {
                
            case .right:
                let percent = min(max(0, relativeTranslation), 1)
                propertyAnimator.fractionComplete = percent
            case .left:
                let percent = min(max(0, -relativeTranslation), 1)
                propertyAnimator.fractionComplete = percent
            }
        case .ended:
            
            if propertyAnimator.fractionComplete > 0.4 {
                propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
            } else {
                propertyAnimator.isReversed = true
                propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
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
    
    /*
    ///Animation with UIView.animation
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
     */
    
    ///Animate with propertyAnimator
    private func animationWithPropertyAnimator(animation: AnimationDirection) {
        
        secondaryImageView.transform = CGAffineTransform(translationX: 1.2 * animation.direction * secondaryImageView.bounds.width, y: 200)
        
        propertyAnimator.addAnimations { [self] in
            
            secondaryImageView.image = photos[currentIndex + animation.index].photo
            
            
            mainImageView.transform = CGAffineTransform(translationX: -1.2 * animation.direction * mainImageView.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
            
            secondaryImageView.transform = .identity
            
        }
        
        propertyAnimator.addCompletion { [self] position in
            
            switch position {
            case .end:
                
                currentIndex = currentIndex + animation.index
                mainImageView.image = photos[currentIndex].photo
                mainImageView.transform = .identity
                secondaryImageView.image = nil
            case .start:
                
                secondaryImageView.image = photos[currentIndex + animation.index].photo
                secondaryImageView.transform = CGAffineTransform(translationX: 1.2 * animation.direction * secondaryImageView.bounds.width, y: 200)
            case .current:
                break
            @unknown default:
                break
            }
        }
    }
}
