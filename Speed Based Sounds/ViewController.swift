//
//  ViewController.swift
//  Speed Based Sounds
//
//  Created by ryan b on 4/12/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var speedLabel: UILabel!
    
    let Manager = CLLocationManager()
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        Manager.delegate = self
        Manager.desiredAccuracy = kCLLocationAccuracyBest
        Manager.requestWhenInUseAuthorization()
        Manager.startUpdatingLocation()
        mapView.mapType = MKMapType.hybrid
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
       let location = locations[0]
        
       let center = location.coordinate
       let region = MKCoordinateRegion(center: center, span: self.span)
        
       mapView.setRegion(region, animated: true)
       self.mapView.showsUserLocation = true
        speedLabel.text = "\(location.speed) Mph"
    }
    
   
    
    

}

