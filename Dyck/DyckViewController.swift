//
//  ViewController.swift
//  Dyck
//
//  Created by Evan Baumgardner on 10/10/15.
//  Copyright © 2015 Evan Baumgardner. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // set initial location in Seattle
        let initialLocation = CLLocation(latitude: 47.6097, longitude: -122.3331)
        centerMapOnLocation(initialLocation)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    let regionRadius: CLLocationDistance = 10000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: - location manager to authorize user location for Maps app
    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    


}

