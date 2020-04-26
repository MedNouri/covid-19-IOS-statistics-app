//
//  AppDelegate.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 28/03/2020.
//  Copyright © 2020 Mohamed Nouri. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
      let root =  UINavigationController(rootViewController: StatistiquesViewController(collectionViewLayout: StretchyHeaderLayout()))
           UINavigationBar.appearance().barTintColor = .SecondeColor
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            UINavigationBar.appearance().isTranslucent = false
        
        
        
            window = UIWindow()
            window?.rootViewController = root
            
 
 
        return true
    }

 


}

