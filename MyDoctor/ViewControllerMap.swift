//
//  ViewControllerMap.swift
//  MyDoctor
//
//  Created by Luiz Fernando Santiago on 9/28/14.
//  Copyright (c) 2014 Luiz Fernando Santiago. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

/*class ViewControllerMap: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var latitude:CLLocationDegrees = 48.399193
        var longitude:CLLocationDegrees = 9.993341
        
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        
        var theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta , longDelta)
        
        var churchLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var theRegion:MKCoordinateRegion = MKCoordinateRegionMake(churchLocation, theSpan)
        var myLocation: MKMapView
        self.mapView.setRegion(theRegion, animated: true)
        
        
        
    }

    @IBAction func RollBackButton(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

---------------------------------------


*/
class ViewControllerMap: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    //var locationManager = CLLocationManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        var userLocation = MKUserLocation()
        println("Location: \(userLocation.location)")
        
        var objectLatitude = 53.204526
        var objectLongitude = 50.111751
        
        var currentLatitude = 53.203715
        var currentLongitude =  50.160374
        
        var latDelta = 0.01
        var longDelta = 0.01
        
        var currentLocationSpan: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var currentLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(currentLatitude, currentLongitude)
        var currentRegion: MKCoordinateRegion = MKCoordinateRegionMake(currentLocation, currentLocationSpan)
        self.mapView.setRegion(currentRegion, animated: true)
        
        var objectLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(objectLatitude, objectLongitude)
        var objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = objectLocation
        objectAnnotation.title = "St. George's Church"
        objectAnnotation.subtitle = "Church of the Great Martyr St. George"
        self.mapView.addAnnotation(objectAnnotation)
    }
    
    
    @IBAction func findMyLocation(sender: AnyObject) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                println("Reverse geocoder failed with error" + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0 {
                let pm = placemarks[0] as CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                println("Problem with the data received from geocoder")
            }
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            println(locality)
            println(postalCode)
            println(administrativeArea)
            println(country)
        }
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while updating location " + error.localizedDescription)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func RollBackButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    

}


/*
class ViewControllerMap: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let latArray = [-23.528657, -23.518514, -23.533796, -23.533796, -23.533888]
        let longArray = [-46.484008, -46.486495, -46.495533, -46.476690, -46.473789]
        
        var lat: CLLocationDegrees = -23.527096772791133
        var long: CLLocationDegrees = -46.48964569157911
        
        var latDelta: CLLocationDegrees = 0.01
        var longDelta: CLLocationDegrees = 0.01
        
        var theSpan: MKCoordinateSpan = MKCoordinateSpanMake(latDelta,longDelta)
        
        var mypos: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat,long)
        
        var myreg: MKCoordinateRegion = MKCoordinateRegionMake(mypos, theSpan)
        
        self.mapView.setRegion(myreg, animated: true)
        
        var myposannot = MKPointAnnotation()
        
        myposannot.coordinate = mypos
        myposannot.title = "Me"
        myposannot.subtitle = "I am here!"
        
        self.mapView.addAnnotation(myposannot)
        
        for var i=0; i<5; ++i {
            
            var latCli: CLLocationDegrees = latArray[i]
            var longCli: CLLocationDegrees = longArray[i]
            
            var myposCli : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latCli,longCli)
            
            var myposannotCli = MKPointAnnotation()
            
            myposannotCli.coordinate = myposCli
            myposannotCli.title = "Cliente" + " - " + String (i)
            myposannotCli.subtitle = "Anotacao" + " - " + String (i)
            
            
            self.mapView.addAnnotation(myposannotCli)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapViewAnnot(mapViewAnnot: MKMapView!,ViewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView{
        
        if annotation is MKUserLocation{
            return nil
        }
        
        let reuseId = "pin"
        
        var pinView = mapViewAnnot.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        
        if(pinView == nil){
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.pinColor = .Red
            pinView!.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as UIButton
        } else {
            pinView!.annotation = annotation
        }
        return pinView!
    }
    
    
    @IBAction func RollBackButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

}
    */
    

