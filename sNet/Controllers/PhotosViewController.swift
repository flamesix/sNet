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
    
    private var propertyAnimator: UIViewPropertyAnimator!
    
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
    
    //    private var isLeftSwipe = false
    //    private var isRightSwipe = false
    public var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard !photos.isEmpty else { return }
        mainImageView.image = photos[currentIndex].photo
        
        /*
         let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
         leftSwipe.direction = .left
         view.addGestureRecognizer(leftSwipe)
         
         let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
         rightSwipe.direction = .right
         view.addGestureRecognizer(rightSwipe)
         */
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned))
        view.addGestureRecognizer(panGesture)
        
        /*
         secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
         
         let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))
         view.addGestureRecognizer(panGestureRecognizer)
         
         setPhotos(photos: photos)
         */
    }
    
    private func animateWithPropertyAnimator(animation: AnimationDirection) {
        
        secondaryImageView.transform = CGAffineTransform(translationX: animation.direction * secondaryImageView.bounds.width, y: 200).concatenating(.init(scaleX: 1.2, y: 1.2))
        
        secondaryImageView.image = photos[currentIndex + animation.index].photo
        
        propertyAnimator = UIViewPropertyAnimator(duration: 1,
                                                  curve: .easeInOut,
                                                  animations: { [self] in
            
            mainImageView.transform = CGAffineTransform(translationX: -animation.direction * mainImageView.bounds.width, y: -100).concatenating(.init(scaleX: 0.6, y: 0.6))
            secondaryImageView.transform = .identity
        })
        
        propertyAnimator.addCompletion { [self] position in
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
    
    @objc func panned(_ panGesture: UIPanGestureRecognizer) {
        switch panGesture.state {
            
        case .began:
            if panGesture.translation(in: view).x > 0 {
                
                guard currentIndex >= 1 else { return }
                animationDirection = .right
                animateWithPropertyAnimator(animation: .right)
                
            } else {
                
                guard currentIndex + 1 < photos.count else { return }
                animationDirection = .left
                animateWithPropertyAnimator(animation: .left)
                
            }
        case .changed:
            
            switch animationDirection {
            case .left:
                
                let percent = min(max(0, -panGesture.translation(in: view).x / 200), 1)
                propertyAnimator.fractionComplete = percent
            case .right:
                
                let percent = min(max(0, panGesture.translation(in: view).x / 200), 1)
                propertyAnimator.fractionComplete = percent
            }
            
        case .ended:
            
            if propertyAnimator.fractionComplete > 0.4 {
                propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
            } else {
                propertyAnimator.isReversed = true
                propertyAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
            }
            
        @unknown default:
            break
        }
    }
    
    /*
     ///if animation from left to right direction should be 1, from right to left -1
     private func animationBegin(direction: CGFloat) {
     propertyAnimator = UIViewPropertyAnimator(duration: 1,
     curve: .easeInOut,
     animations: { [self] in
     secondaryImageView.transform = CGAffineTransform(translationX: direction * secondaryImageView.bounds.width, y: 200).concatenating(.init(scaleX: 1.2, y: 1.2))
     mainImageView.transform = CGAffineTransform(translationX: -direction * mainImageView.bounds.width, y: -100).concatenating(.init(scaleX: 0.6, y: 0.6))
     secondaryImageView.transform = .identity
     })
     }
     */
    
    /*
     @objc func swipedLeft() {
     
     guard currentIndex + 1 < photos.count else { return }
     
     secondaryImageView.transform = CGAffineTransform(translationX: secondaryImageView.bounds.width, y: 200).concatenating(.init(scaleX: 1.2, y: 1.2))
     secondaryImageView.image = photos[currentIndex + 1].photo
     
     UIView.animate(withDuration: 1,
     delay: 0,
     options: .curveEaseInOut) { [self] in
     mainImageView.transform = CGAffineTransform(translationX: -mainImageView.bounds.width, y: -100).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
     
     secondaryImageView.transform = .identity
     
     } completion: { [self] _ in
     
     currentIndex += 1
     mainImageView.image = photos[currentIndex].photo
     mainImageView.transform = .identity
     
     secondaryImageView.image = nil
     }
     
     }
     
     
     
     @objc func swipedRight() {
     
     guard currentIndex >= 1 else { return }
     
     
     secondaryImageView.transform = CGAffineTransform(translationX: -secondaryImageView.bounds.width, y: 200).concatenating(.init(scaleX: 1.2, y: 1.2))
     secondaryImageView.image = photos[currentIndex - 1].photo
     
     UIView.animate(withDuration: 1,
     delay: 0,
     options: .curveEaseInOut) { [self] in
     mainImageView.transform = CGAffineTransform(translationX: mainImageView.bounds.width, y: -100).concatenating(.init(scaleX: 0.6, y: 0.6))
     
     secondaryImageView.transform = .identity
     } completion: { [self] _ in
     currentIndex -= 1
     mainImageView.image = photos[currentIndex].photo
     mainImageView.transform = .identity
     secondaryImageView.image = nil
     }
     
     }
     
     ///if animation from left to right direction shoulb be -1, from right to left +1
     private func swipedAnimation(direction: CGFloat) {
     
     secondaryImageView.transform = CGAffineTransform(translationX: -direction * secondaryImageView.bounds.width, y: 200).concatenating(.init(scaleX: 1.2, y: 1.2))
     secondaryImageView.image = photos[currentIndex - 1].photo
     
     UIView.animate(withDuration: 1,
     delay: 0,
     options: .curveEaseInOut) { [self] in
     mainImageView.transform = CGAffineTransform(translationX: direction * mainImageView.bounds.width, y: -100).concatenating(.init(scaleX: 0.6, y: 0.6))
     
     secondaryImageView.transform = .identity
     } completion: { [self] _ in
     currentIndex = currentIndex - Int(direction)
     mainImageView.image = photos[currentIndex].photo
     mainImageView.transform = .identity
     secondaryImageView.image = nil
     }
     }
     */
    
    /*
     @objc func viewPanned(_ recognizer: UIPanGestureRecognizer) {
     
     switch recognizer.state {
     case .began:
     mainImageView.transform = .identity
     mainImageView.image = photos[currentIndex].photo
     //   secondaryImageView.transform = .identity
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
     if currentIndex == (photos.count - 1) {
     propertyAnimator.stopAnimation(true)
     return
     }
     onChange(isLeft: true)
     
     
     propertyAnimator.stopAnimation(true)
     propertyAnimator.addAnimations { [self] in
     mainImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
     mainImageView.transform = mainImageView.transform.concatenating(CGAffineTransform(scaleX: 0.4, y: 0.4))
     
     // secondaryImageView.transform = .identity
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
     mainImageView.transform = mainImageView.transform.concatenating(CGAffineTransform(scaleX: 0.4, y: 0.4))
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
     mainImageView.image = photos[currentIndex].photo
     
     if isLeft {
     secondaryImageView.image = photos[currentIndex + 1].photo
     secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
     } else {
     secondaryImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
     secondaryImageView.image = photos[currentIndex - 1].photo
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
     mainImageView.image = photos[currentIndex].photo
     photosView.bringSubviewToFront(mainImageView)
     }
     
     func setPhotos(photos: [PhotosOfFriend]) {
     mainImageView.image = photos.first?.photo
     }
     */
    
    
}
