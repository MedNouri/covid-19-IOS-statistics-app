//
//  Statistiques + Extension.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 12/04/2020.
//  Copyright © 2020 Mohamed Nouri. All rights reserved.
//

import UIKit


extension StatistiquesViewController{
    
    func SetUpView(){
          
         
            refreshView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.insertSubview(refreshView, at: 0)
            refreshView.delegate = self
            view.backgroundColor = .black
            collectionView.backgroundColor = .black
            rootStuckInfo.addArrangedSubview(navBarTitleLabel)
            rootStuckInfo.addArrangedSubview(navBarDateLabe)
            backButton.customView =  rootStuckInfo
            self.navigationItem.leftBarButtonItem = backButton
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
 
            //self.navigationItem.rightBarButtonItems = [MapButton ]
            definesPresentationContext = true
             searchController.obscuresBackgroundDuringPresentation = false
           
            searchController.searchBar.placeholder = "Search"
            navigationItem.searchController = searchController
             definesPresentationContext = true
        
        view.addSubview(ActivitySearch)
        ActivitySearch.centerInSuperview()
        ActivitySearch.startAnimating()
          collectionView.isHidden = true
        
    }
    
    
    
    
    
    
    
}
