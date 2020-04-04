//
//  MapModele.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 30/03/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//

import Foundation
 

 

 

 struct RootClass: Codable {
     let country, province: String?
     let lat, lon: Double?
     let date: String?
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

