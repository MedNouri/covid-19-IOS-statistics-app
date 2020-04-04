//
//  NewtworkCalls.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 28/03/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//

import Foundation
 
extension StatistiquesViewController{

    func GetGloabalNUmber()  {
     

        var request = URLRequest(url: URL(string: "https://covidapi.info/api/v1/global")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
           
          guard let data = data else {
            print(String(describing: error))
            return
          }
         
         
            
     
                do {
                   let res = try JSONDecoder().decode(GlobalCount.self, from: data)
                    self.GlobalInformation = res
                
                } catch let error {
                   print(error)
                }
          
            
       
        }

        task.resume()
   

    }

    
    func GetTableDat(){
           var request = URLRequest(url: URL(string: "https://api.covid19api.com/summary")!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              guard let data = data else {
                print(String(describing: error))
                return
              }
                   do {
                            let res = try JSONDecoder().decode(CountryCount.self, from: data)
     
                  
                        self.DataSourceTbael = res
                    
 
                    self.DataSourceTbael?.countries.removeAll(where: { (countrey) -> Bool in
                                       countrey.totalConfirmed == 0 && countrey.totalDeaths == 0
                                   })
                                   
                    self.DataSourceTbael?.countries.sort(by: {
                        $0.totalConfirmed > $1.totalConfirmed
                    })
                   
                    
               
                    
                    
                         DispatchQueue.main.async {
                             self.collectionView.reloadData()
                             }
                    
                         } catch let error {
                            print(error)
                         }
                   
        
            }

            task.resume()
   
        }
    
    
    
    
    }
    




 
