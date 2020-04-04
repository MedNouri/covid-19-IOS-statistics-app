//
//  MapData.swift
//  Skeez
//
//  Created by Mohamed Nouri on 11/02/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//

 
import MapKit
import CoreLocation

struct MapData: Decodable {
    let cycles: [Cycle]

    let centerLatitude: CLLocationDegrees
    let centerLongitude: CLLocationDegrees
    let latitudeDelta: CLLocationDegrees
    let longitudeDelta: CLLocationDegrees

    var region: MKCoordinateRegion {
        let center = CLLocationCoordinate2D(latitude: centerLatitude, longitude: centerLongitude)
        let span = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        return MKCoordinateRegion(center: center, span: span)
    }
}
