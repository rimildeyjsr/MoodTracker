//
//  NewEntryViewController.swift
//  MoodTracker
//
//  Created by Rimil Dey on 18/02/18.
//  Copyright © 2018 Rimil Dey. All rights reserved.
//

import UIKit
import CoreLocation

class NewEntryViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        entryTextView.inputAccessoryView = toolbar
        entryTextView.becomeFirstResponder()
        locationManager.delegate = self
    }
    
    // MARK: - outlets
    
    @IBOutlet weak var entryTextView: UITextView!
    @IBOutlet var toolbar: UIView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    // MARK: - Interactions
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func locationButton(_ sender: UIButton) {
        getLocation()
    }
    
    // MARK: - Location
    let locationManager = CLLocationManager()
    
    // MARK: Location Functions
    func getLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.startUpdatingLocation()
    }
    
    // MARK: CLLocation Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            if let placemarksData = placemarks {
                let locationData = placemarksData[0]
                // San Francisco, CA zip, United States
                let city = locationData.locality!
                let state = locationData.administrativeArea!
                let zipCode = locationData.postalCode!
                let country = locationData.country!
                let location = "\(city), \(state) \(zipCode), \(country)"
                
                self.locationLabel.text = location
                
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
   

}
