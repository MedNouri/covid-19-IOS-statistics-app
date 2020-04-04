//
//  CycleAnnotationView.swift
//  Skeez
//
//  Created by Mohamed Nouri on 11/02/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//

import MapKit

private let multiWheelCycleClusterID = "multiWheelCycle"

/// - Tag: UnicycleAnnotationView
class UnicycleAnnotationView: MKMarkerAnnotationView {

    static let ReuseID = "unicycleAnnotation"

    /// - Tag: ClusterIdentifier
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = "unicycle"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultLow
        markerTintColor = UIColor.black
        glyphImage = #imageLiteral(resourceName: "homeIcon")
    }
}

/// - Tag: BicycleAnnotationView
class BicycleAnnotationView: MKMarkerAnnotationView {

    static let ReuseID = "bicycleAnnotation"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = multiWheelCycleClusterID
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// - Tag: DisplayConfiguration
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultHigh
        markerTintColor = UIColor.black
        glyphImage = #imageLiteral(resourceName: "apple")
    }
}

class TricycleAnnotationView: MKMarkerAnnotationView {

    static let ReuseID = "tricycleAnnotation"

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = multiWheelCycleClusterID
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultHigh
        markerTintColor =  UIColor.black
        //glyphImage = #imageLiteral(resourceName: "Star")
    }
}
