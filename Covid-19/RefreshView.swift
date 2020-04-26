//
//  RefreshView.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 29/03/2020.
//  Copyright © 2020 Mohamed Nouri. All rights reserved.
//

import Foundation
import UIKit


private let sceneHeight: CGFloat = 180

protocol RefreshViewDelegate: class {
 func refreshViewDidRefresh(refreshView: RefreshView)
}

class RefreshView: UIView {
    
    private unowned var scrollView: UIScrollView
    var progressPercentage: CGFloat = 0
    var refreshItems = [RefreshItem]()
    var refreshing = false
    weak var delegate: RefreshViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        scrollView = UIScrollView()
        super.init(coder:aDecoder)!
        setupRefreshItems()
        
    }
    
    func setupRefreshItems() {
        let groundImageView = UIImageView(image:UIImage(named: "ground"))
        let catImageView = UIImageView(image:UIImage(named: "cat"))
        let capeBackImageView = UIImageView(image:UIImage(named: "cape_back"))
        let capeFrontImageView = UIImageView(image:UIImage(named: "cape_front"))
        
        
        
        refreshItems = [
            
            RefreshItem(view: groundImageView, centerEnd: CGPoint(x: bounds.midX, y: bounds.height - groundImageView.bounds.height / 2), parallaxRatio: 0.5, sceneHeight: sceneHeight),
            
            RefreshItem(view: capeBackImageView, centerEnd: CGPoint(x: bounds.midX - 40, y: bounds.height - groundImageView.bounds.height/2 - capeBackImageView.bounds.height / 2 - 20), parallaxRatio: -1.3, sceneHeight: sceneHeight),
            
            RefreshItem(view: capeFrontImageView, centerEnd: CGPoint(x: bounds.midX + 40, y: bounds.height - groundImageView.bounds.height / 2 - capeFrontImageView.bounds.height / 2 - 20), parallaxRatio: -1, sceneHeight: sceneHeight),
            
            
            RefreshItem(view: catImageView, centerEnd: CGPoint(x: bounds.midX, y: bounds.height - groundImageView.bounds.height/2 - catImageView.bounds.height / 2), parallaxRatio: 1, sceneHeight: sceneHeight)
            
        ]
        
        for refreshItem in refreshItems {
            addSubview(refreshItem.view)
        }
        
        
    }
    
    func updateRefreshItemPositions() {
        for refreshItem in refreshItems {
            refreshItem.updateViewPositionForPercentage(progressPercentage)
        }
    }
    
    
    init(frame: CGRect, scrollView: UIScrollView) {
        self.scrollView = scrollView
        super.init(frame:frame)
        clipsToBounds = true
        
        setupRefreshItems()
    }
    
    func updateBackgroundColor() {
        backgroundColor = .black
 
    }
    
    func beginRefreshing() {
        
        refreshing = true
        UIView.animateKeyframes(withDuration: 0.4, delay: 0, options: UIView.KeyframeAnimationOptions(), animations: {
            () -> Void in
            self.scrollView.contentInset.top += sceneHeight
        }, completion: { (_) -> Void in
            
        })
    }
    func endRefreshing() {
        refreshing = false
        UIView.animateKeyframes(withDuration: 0.4, delay: 0, options: UIView.KeyframeAnimationOptions(), animations: {
            () -> Void in
            self.scrollView.contentInset.top -= sceneHeight
        }, completion: { (_) -> Void in
            
        })
    }
    
}


extension RefreshView: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if !refreshing && progressPercentage == 1 {
            beginRefreshing()
            targetContentOffset.pointee.y = -scrollView.contentInset.top
            delegate?.refreshViewDidRefresh(refreshView: self)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if refreshing {
            return
        }
        let refreshViewVisibleHeight = max(0, -(scrollView.contentOffset.y + scrollView.contentInset.top))
        progressPercentage = min(1, refreshViewVisibleHeight / sceneHeight)
        
        updateBackgroundColor()
        updateRefreshItemPositions()
    }
}



extension UIImageView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 2
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}


extension UIColor{
   static let SecondeColor = UIColor(named: "SecondeBackGroundColor")
    static let redColor = UIColor(named: "reDTextColor")
    static let greenColor = UIColor(named: "GreenTextColor")
    static let DeathColor = UIColor(named: "DeathColor")
 }
