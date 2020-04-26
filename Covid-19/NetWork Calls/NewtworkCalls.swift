//
//  NewtworkCalls.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 28/03/2020.
//  Copyright © 2020 Mohamed Nouri. All rights reserved.
//

import Foundation

extension StatistiquesViewController{
    
    
    
    func GetTableDat( completionHandler: @escaping (CountryCount?) -> Void){
        var request = URLRequest(url: URL(string: "https://api.covid19api.com/summary")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completionHandler(nil)
                print(String(describing: error))
                return
            }
            
           // print(String(data: data, encoding: .utf8))
            do {
                var res = try JSONDecoder().decode(CountryCount.self, from: data)
   
                     res.countries.removeAll(where: { (countrey) -> Bool in
                    countrey.totalConfirmed == 0 && countrey.totalDeaths == 0
                })
                
                res.countries.sort(by: {
                    $0.totalConfirmed > $1.totalConfirmed
                })
                
               
                   completionHandler(res)
              
              
                
            } catch let error {
                completionHandler(nil)
                print(error)
            }
            
            
        }
        
        task.resume()
        
    }
    
    
    
    
}






