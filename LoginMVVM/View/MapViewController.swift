//
//  MapViewController.swift
//  LoginMVVM
//
//  Created by Narender Kumar on 18/08/22.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    static var identifier: String { return String(describing: self)}
    var lattitude: Double?
    var longitude: Double?
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        
        map.mapType = .standard
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        setMapData()
    }
    
    private func setMapData(){
        let center = CLLocationCoordinate2D(latitude: lattitude ?? 0.0, longitude: longitude ?? 0.0)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
           annotation.coordinate = center
        annotation.title = "\(center.latitude) \(center.longitude)"
           annotation.subtitle = "current location"
           map.addAnnotation(annotation)
    }

}
