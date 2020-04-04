//
//  TabBarMenu.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 30/03/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//

import Foundation
import UIKit

class HomeTabBarController: UITabBarController {
    
    let News =  UINavigationController(rootViewController: StatistiquesViewController(collectionViewLayout: StretchyHeaderLayout()))
     let Maps = UINavigationController(rootViewController:MapViewController())
 

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .SecondeColor
        //
       tabBar.tintColor = .white
        let searchVCitem = UITabBarItem()
        
        searchVCitem.image = #imageLiteral(resourceName: "Stat")
            searchVCitem.title = nil
        News.tabBarItem = searchVCitem
        
        
       let MapVCitem = UITabBarItem()
            
      
       
              MapVCitem.image = #imageLiteral(resourceName: "map")
        MapVCitem.imageInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
            Maps.tabBarItem = MapVCitem
            
        
         
           
        
        
        
        
        
        self.viewControllers = [News ,Maps]
        
        for tabIntem in viewControllers!{
            
            tabIntem.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            tabIntem.hidesBottomBarWhenPushed = true
            

        }
        
        
        
        
        
        
        //selectedViewController = searchVC
        selectedIndex = 0
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            // Fallback on earlier versions         view.backgroundColor = UIColor(named: "BackgroundBleuColor")

        }
        if #available(iOS 13.0, *) {
        self.overrideUserInterfaceStyle = .dark
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    private func animate(_ imageView: UIImageView) {
         UIView.animate(withDuration: 0.1, animations: {
             imageView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
         }) { _ in
             UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: .curveEaseInOut, animations: {
                 imageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
             }, completion: nil)
         }
     }
     
     override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
     
     }
}
 
