//
//  ViewController.swift
//  Dyck
//
//  Created by Evan Baumgardner on 10/10/15.
//  Copyright © 2015 Evan Baumgardner. All rights reserved.
//

import UIKit
import MapKit

class DyckViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // set initial location in Seattle
        let initialLocation = CLLocation(latitude: 47.6097, longitude: -122.3331)
        centerMapOnLocation(initialLocation)
        
        // If we want more info (more than 2 lines), we have to create our own custom MKAnnotationView. In the meantime, putting a line break in after each store name with the established date for future reference. 
        
        let wallingfordDicks = DicksDriveIn(storeName: "Dick's Drive-In: Wallingford\n (Est. 1954)", storeAddress: "111 N.E. 45th St. Seattle, WA,98105", coordinate: CLLocationCoordinate2D(latitude: 47.661117900, longitude: -122.327791100));
        
        mapView.addAnnotation(wallingfordDicks)
        //mapView.addAnnotation(broadwayDicks)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    let regionRadius: CLLocationDistance = 8000
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
           centerMapOnLocation(locationManager.location!)
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    


}

