//
//  Cycle.swift
//  Skeez
//
//  Created by Mohamed Nouri on 11/02/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//
 
import MapKit

class Cycle: NSObject, Decodable, MKAnnotation {
    
    enum CycleType: Int, Decodable {
        case unicycle
        case bicycle
        case tricycle
    }
    
    var type: CycleType = .unicycle
    
    private var latitude: CLLocationDegrees = 0
    private var longitude: CLLocationDegrees = 0
    
    
    
     init(cordoinat:CLLocationCoordinate2D) {
        super.init()
        
        coordinate = cordoinat
    }
    
    
    // This property must be key-value observable, which the `@objc dynamic` attributes provide.
    @objc dynamic var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        set {
            // For most uses, `coordinate` can be a standard property declaration without the customized getter and setter shown here.
            // The custom getter and setter are needed in this case because of how it loads data from the `Decodable` protocol.
            latitude = newValue.latitude
            longitude = newValue.longitude
        }
    }
}
