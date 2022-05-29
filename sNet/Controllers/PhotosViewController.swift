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
    
    var images = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "4")!, UIImage(named: "5")!]
    
    private var propertyAnimator: UIViewPropertyAnimator!
    private var isLeftSwipe = false
    private var isRightSwipe = false
    private var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
        
        setImages(images: images)
    }
    
    /*
     @objc func viewPanned(_ recognizer: UIPanGestureRecognizer) {
     propertyAnimator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut, animations: {
     
     })
     
     switch recognizer.state {
     case .changed:
     print("changed")
     case .began:
     print("began")
     case .ended:
     print("ended")
     default:
     break
     }
     //        propertyAnimator.addCompletion({ position in
     //            switch position {
     //            case .end:
     //                <#code#>
     //            case .start:
     //                <#code#>
     //            case .current:
     //                <#code#>
     //            @unknown default:
     //                break
     //            }
     //        })
     
     
     }
     */
    
    @objc func viewPanned(_ recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            mainImageView.transform = .identity
            mainImageView.image = images[currentIndex]
            secondaryImageView.transform = .identity
            photosView.bringSubviewToFront(mainImageView)
            
            propertyAnimator?.startAnimation()
            propertyAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                      curve: .easeInOut,
                                                      animations: {
                self.mainImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
            })
            propertyAnimator.pauseAnimation()
            isLeftSwipe = false
            isRightSwipe = false
            
        case .changed:
            var translation = recognizer.translation(in: view)
            
            if translation.x < 0 && (!isLeftSwipe) {
                if currentIndex == (images.count - 1) {
                    propertyAnimator.stopAnimation(true)
                    return
                }
                onChange(isLeft: true)
                
                
                propertyAnimator.stopAnimation(true)
                propertyAnimator.addAnimations { [self] in
                    mainImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
                    secondaryImageView.transform = .identity
                }
                propertyAnimator.addCompletion { _ in
                    self.onChangeCompletion(isLeft: true)
                }
                
                propertyAnimator.startAnimation()
                propertyAnimator.pauseAnimation()
                isLeftSwipe = true
            }
            
            if translation.x > 0 && (!isRightSwipe) {
                if currentIndex == 0 {
                    propertyAnimator.stopAnimation(true)
                    return
                }
                onChange(isLeft: false)
                propertyAnimator.stopAnimation(true)
                propertyAnimator.addAnimations { [self] in
                    mainImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                    secondaryImageView.transform = .identity
                }
                propertyAnimator.addCompletion { _ in
                    self.onChangeCompletion(isLeft: false)
                }
                propertyAnimator.startAnimation()
                propertyAnimator.pauseAnimation()
                isRightSwipe = true
            }
            
            if isRightSwipe && (translation.x < 0) {return}
            if isLeftSwipe && (translation.x > 0) {return}
            
            if translation.x < 0 {
                translation.x = -translation.x
            }
            propertyAnimator.fractionComplete = translation.x / (UIScreen.main.bounds.width)
            
        case .ended:
            if let animator = propertyAnimator,
               animator.isRunning {
                return
            }
            var translation = recognizer.translation(in: view)
            
            if translation.x < 0 {
                translation.x = -translation.x
                
            }
            
            if translation.x / (UIScreen.main.bounds.width) > 0.5  {
                propertyAnimator.startAnimation()
            }
            else {
                propertyAnimator.stopAnimation(true)
                propertyAnimator.finishAnimation(at: .start)
                propertyAnimator.addAnimations { [self] in
                    mainImageView.transform = .identity
                    
                    if isLeftSwipe {
                        secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                    }
                    if isRightSwipe {
                        secondaryImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
                    }
                }
                
                propertyAnimator.addCompletion { _ in
                    self.mainImageView.transform = .identity
                    // secondaryImageView.transform = .identity
                }
                
                propertyAnimator.startAnimation()
            }
        default:
            return
        }
    }
    
    private func onChange(isLeft: Bool) {
        mainImageView.transform = .identity
        // secondaryImageView.transform = .identity
        mainImageView.image = images[currentIndex]
        
        if isLeft {
            secondaryImageView.image = images[currentIndex + 1]
            secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        } else {
            secondaryImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
            secondaryImageView.image = images[currentIndex - 1]
        }
    }
    
    
    private func onChangeCompletion(isLeft: Bool) {
        mainImageView.transform = .identity
        //    secondaryImageView.transform = .identity
        if isLeft {
            currentIndex += 1
        }
        else {
            currentIndex -= 1
        }
        mainImageView.image = images[currentIndex]
        photosView.bringSubviewToFront(mainImageView)
    }
    
    func setImages(images: [UIImage]) {
        self.images = images
        if images.count > 0 {
            mainImageView.image = images.first
        }
    }
    
    
}
