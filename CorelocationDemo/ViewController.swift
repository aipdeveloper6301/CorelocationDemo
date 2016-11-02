//
//  ViewController.swift
//  CorelocationDemo
//
//  Created by Admin on 7/28/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController ,CLLocationManagerDelegate{

    @IBOutlet var lblLocation: UILabel!
    @IBOutlet var mapview: MKMapView!
    var locationManager=CLLocationManager()
    var myposition=CLLocationCoordinate2D()
    
    
    var destination:MKMapItem = MKMapItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        locationManager.delegate=self
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.requestLocation()
        }
        
        locationManager.startUpdatingLocation()
        
        var locationTuples: [(textField: UITextField!, mapItem: MKMapItem?)]!
        locationTuples = [(sourceField, nil), (destinationField1, nil), (destinationField2, nil)]
        
        /*
         https://www.raywenderlich.com/110054/routing-mapkit-core-location
         */
        
    }
    @IBAction func showdirection(sender: AnyObject) {
        
    
    }
    
    
    @IBAction func StartGPS(sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print("Get Locatoin \( newLocation.coordinate.latitude),\(newLocation.coordinate.longitude)")

        myposition = newLocation.coordinate
       // locationManager.stopUpdatingHeading()
        
    
        lblLocation.text = "Get Locatoin \( newLocation.coordinate.latitude),\(newLocation.coordinate.longitude)"
        
        
        let span = MKCoordinateSpanMake(0.05,0.05)
        let region = MKCoordinateRegion(center: newLocation.coordinate,span: span)
            mapview.setRegion(region, animated: true)
        locationManager.startUpdatingLocation()
        
        //make annotaton
        
        let locCoord = CLLocationCoordinate2D(latitude: 37.33  , longitude: -122.2)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locCoord
        annotation.title = "Stror"
        annotation.subtitle = "Location of stroe"
        
        mapview.addAnnotation(annotation)

        //process for route
        
        CLGeocoder().reverseGeocodeLocation(newLocation,
                                            completionHandler: {(placemarks:[CLPlacemark]?, error:NSError?) -> Void in
                                                if let placemarks = placemarks {
                                                    let placemark = placemarks[0]
                                                }
        })
        
        
           }


}

