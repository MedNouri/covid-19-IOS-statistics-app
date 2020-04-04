//
//  MapViewNetworkCalls.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 30/03/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//

import Foundation
extension MapViewController{

    
   
    
 func GetData( completion: @escaping (_ result: [RootClass]?) -> Void)  {
  

     var request = URLRequest(url: URL(string: "https://api.covid19api.com/country/france/status/confirmed")!,timeoutInterval: Double.infinity)
      request.httpMethod = "GET"

     let task = URLSession.shared.dataTask(with: request) { data, response, error in
        
       guard let data = data else {
         print(String(describing: error))
         completion(nil)
        return
       }
      
      
         
  
             do {
                let res = try JSONDecoder().decode([RootClass].self, from: data)
                DispatchQueue.main.async {
                     completion( res)
                }
                
              
             } catch let error {
                print(error)
                completion(nil)
             }
       
         
    
     }

     task.resume()


 }

 
 
 
 
 
 
 }
 
