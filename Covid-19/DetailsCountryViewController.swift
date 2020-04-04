//
//  DetailsCountryViewController.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 02/04/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//

import UIKit

class DetailsCountryViewController: UIViewController {

    let curvedlineChart = LineChart()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .SecondeColor
        // Do any additional setup after loading the view.
        view.addSubview(curvedlineChart)
        curvedlineChart.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5), size: .zero)
        curvedlineChart.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
        
                
    
        
                 var request = URLRequest(url: URL(string: "https://api.covid19api.com/live/country/China/status/confirmed")!,timeoutInterval: Double.infinity)
                   request.httpMethod = "GET"

                   let task = URLSession.shared.dataTask(with: request) { data, response, error in
                     guard let data = data else {
                       print(String(describing: error))
                       return
                     }
                          do {
                            let res = try JSONDecoder().decode([StatArray].self, from: data)
            
                         
                          
                           
                      
                    
                                DispatchQueue.main.async {
                                    self.curvedlineChart.dataEntries = self.generateRandomEntries(fromData: res)
                                    self.curvedlineChart.isCurved = true
                                    }
                           
                                } catch let error {
                                   print(error)
                                }
                          
               
                   }

                   task.resume()
          
            
        
        
             
                
   
            }
    
    
    
    
    
    
    
    
    
    
    
            
    private func generateRandomEntries(fromData : [StatArray]) -> [PointEntry] {
                var result: [PointEntry] = []
        for i in  fromData {
            let dateFormatter = DateFormatter()
               dateFormatter.dateFormat = "yyyy-MM"
            let date = dateFormatter.date(from:i.date)
            result.append(PointEntry(value: i.cases ?? 0, label: dateFormatter.string(from:  date ?? Date())))
                }
                return result
            }
        }








// MARK: - WelcomeElement
struct StatArray: Codable {
    let country: String?
    let province: String?
    let lat, lon: Double?
    let date: String
    let cases: Int?
    let status: String?

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case province = "Province"
        case lat = "Lat"
        case lon = "Lon"
        case date = "Date"
        case cases = "Cases"
        case status = "Status"
    }
}

 
 
 
