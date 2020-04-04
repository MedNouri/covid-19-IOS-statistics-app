//
//  MapViewController.swift
//  Covid-19
//
//  Created by Mohamed Nouri on 30/03/2020.
//  Copyright © 2020 Start Development. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController   ,MKMapViewDelegate,CLLocationManagerDelegate{

 
    
     var offrecollectionview: UICollectionView!
let mapView = MKMapView()
    
    typealias CompletionHandler = () -> [RootClass]?
    
 
    
    private let numberOfColumns = 2
    private let cellPadding: CGFloat = 6

    // 3
    private var cache: [UICollectionViewLayoutAttributes] = []

    // 4
    private var contentHeight: CGFloat = 0
 
        let rootStuckInfo = UIStackView()
 
    let backButton = UIBarButtonItem()
 
     let titleLbl = UILabel()
     let titleLbl2 = UILabel()
     
    
    
    
    
    
    
        private var userTrackingButton: MKUserTrackingButton!
        private var scaleView: MKScaleView!
        
        // Create a location manager to trigger user tracking
        private let locationManager = CLLocationManager()
        
        private func setupCompassButton() {
            let compass = MKCompassButton(mapView: mapView)
            compass.compassVisibility = .visible
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: compass)
            mapView.showsCompass = false
        }

        private func setupUserTrackingButtonAndScaleView() {
            mapView.showsUserLocation = true
            
            userTrackingButton = MKUserTrackingButton(mapView: mapView)
         //   userTrackingButton.layer.backgroundColor = UIColor.translucentButtonColor?.cgColor
            userTrackingButton.layer.borderColor = UIColor.white.cgColor
            userTrackingButton.layer.borderWidth = 1
            userTrackingButton.layer.cornerRadius = 5
            userTrackingButton.isHidden = true // Unhides when location authorization is given.
            view.addSubview(userTrackingButton)
            
            // By default, `MKScaleView` uses adaptive visibility, so it only displays when zooming the map.
            // This is behavior is confirgurable with the `scaleVisibility` property.
            scaleView = MKScaleView(mapView: mapView)
            scaleView.legendAlignment = .trailing
            view.addSubview(scaleView)
            
            let stackView = UIStackView(arrangedSubviews: [scaleView, userTrackingButton])
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.spacing = 10
            view.addSubview(stackView)
            
            NSLayoutConstraint.activate([stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                                         stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)])
        }

        private func registerAnnotationViewClasses() {
            mapView.register(UnicycleAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            mapView.register(BicycleAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            mapView.register(TricycleAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
            mapView.register(ClusterAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        }
        
        private func loadDataForMapRegionAndBikes() {
            GetData { (result) in
    
                
                guard let Data = result else {return}
                
                var poinst = [MKAnnotation]()
                for location in Data {
                  
                    let point = Cycle(cordoinat: .init(latitude: location.lat ?? 0, longitude: location.lon ?? 0))
                    poinst.append(point)
                }
                
                self.mapView.addAnnotations(poinst)
                
      
            }
           
            var region: MKCoordinateRegion {
                        let center = CLLocationCoordinate2D(latitude: 48.8534, longitude: 2.3488)
                        let span = MKCoordinateSpan(latitudeDelta: 48.8534, longitudeDelta: 2.3488)
                        return MKCoordinateRegion(center: center, span: span)
                    }
                  self.mapView.region =  region
            
            
//            guard let plistURL = Bundle.main.url(forResource: "Data", withExtension: "plist") else {
//                fatalError("Failed to resolve URL for `Data.plist` in bundle.")
//            }
//
//            do {
//                let plistData = try Data(contentsOf: plistURL)
//                let decoder = PropertyListDecoder()
//                let decodedData = try decoder.decode(MapData.self, from: plistData)
//                mapView.region = decodedData.region
//                mapView.addAnnotations(decodedData.cycles)
//            } catch {
//                fatalError("Failed to load provided data, error: \(error.localizedDescription)")
//            }

    
    
    
    }
        
  
        
  

 

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? Cycle else { return nil }

            switch annotation.type {
            case .unicycle:
                return UnicycleAnnotationView(annotation: annotation, reuseIdentifier: UnicycleAnnotationView.ReuseID)
            case .bicycle:
                return BicycleAnnotationView(annotation: annotation, reuseIdentifier: BicycleAnnotationView.ReuseID)
            case .tricycle:
                return TricycleAnnotationView(annotation: annotation, reuseIdentifier: TricycleAnnotationView.ReuseID)
            }
    }

 
     
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            let locationAuthorized = status == .authorizedWhenInUse
            userTrackingButton.isHidden = !locationAuthorized
        }
   

    
    
    
    
    
    
    
    
    
    
    
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
    //    let logoutBarButtonItem = UIBarButtonItem(title: "Filtrer", style: .done, target: self, action: #selector(logoutUser))
      //     self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
      
    
        if #available(iOS 13.0, *) {
        self.overrideUserInterfaceStyle = .dark
        }
 
        definesPresentationContext = true

        
               
                       titleLbl.text = "COVID -19"
                       titleLbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
                        titleLbl.textColor = .white
                       titleLbl2.font = UIFont.systemFont(ofSize: 12, weight: .regular)
                       titleLbl2.textColor = .darkGray
                titleLbl2.text = "2020-3-31"
                       rootStuckInfo.addArrangedSubview(titleLbl)
                       rootStuckInfo.addArrangedSubview(titleLbl2)
                       rootStuckInfo.axis = .vertical
                       rootStuckInfo.spacing = 0
                       
                       rootStuckInfo.contentMode = .left
                       
                       
                       backButton.customView =  rootStuckInfo
                       
                       
                       self.navigationItem.leftBarButtonItem = backButton


        
//
//               let leftMargin:CGFloat = 10
//               let topMargin:CGFloat = 60
//               let mapWidth:CGFloat = view.frame.size.width-20
//               let mapHeight:CGFloat = 300
//
//               mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
               
               mapView.mapType = .standard
               mapView.isZoomEnabled = true
               mapView.isScrollEnabled = true
       
           
               
               view.addSubview(mapView)
                 mapView.fillSuperview()
        
        
 
               setupUserTrackingButtonAndScaleView()
               registerAnnotationViewClasses()
  
               loadDataForMapRegionAndBikes()
    
    
    }
    
  
  
    
    
 
    
//
//
//      @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
//             if sender.selectedSegmentIndex == 0 {
//                viewtype = .favoris
//                Jobscollectionview.reloadData()
//              }
//             if sender.selectedSegmentIndex == 1 {
//
//                 viewtype = .condidatures
//                 Jobscollectionview.reloadData()
//
//                  }
//       }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
 

