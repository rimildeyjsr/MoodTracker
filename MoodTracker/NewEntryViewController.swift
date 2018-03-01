//
//  NewEntryViewController.swift
//  MoodTracker
//
//  Created by Rimil Dey on 18/02/18.
//  Copyright © 2018 Rimil Dey. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class NewEntryViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        entryTextView.inputAccessoryView = toolbar
        entryTextView.becomeFirstResponder()
        loadDateAndTime()
        locationManager.delegate = self
        
    }
    
    
    // MARK: - Location
    let locationManager = CLLocationManager()
    
    // MARK: - outlets
    
    @IBOutlet weak var entryTextView: UITextView!
    @IBOutlet var toolbar: UIView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var admireImage: UIImageView!
    @IBOutlet weak var happyImage: UIImageView!
    @IBOutlet weak var smileyImage: UIImageView!
    @IBOutlet weak var frownImage: UIImageView!
    
    var selectedMood: String?
    // MARK: - Interactions
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        saveEntry()
    }
    
    @IBAction func locationButton(_ sender: UIButton) {
        getLocation()
    }
   
    @IBAction func tappedAdmireImage(_ sender: UITapGestureRecognizer) {
        selectedMood = "admire face icon"
    }
    
    @IBAction func tappedHappyImage(_ sender: UITapGestureRecognizer) {
        selectedMood = "happy face icon"
    }
    
    @IBAction func tappedSmileyImage(_ sender: UITapGestureRecognizer) {
        selectedMood = "smiley face icon"
    }
    
    @IBAction func tappedFrownImage(_ sender: UITapGestureRecognizer) {
        selectedMood = "frown face icon"
    }
    
    
    // MARK: Location Functions
    func getLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.startUpdatingLocation()
    }
    
    // MARK: CLLocation Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
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
    
    // MARK: - loading date and time
    var currentDate: Date?
    
    let dateformatter = DateFormatter()
    
    func loadDateAndTime() {
        currentDate = Date()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .medium
        dateTimeLabel.text = dateformatter.string(from: currentDate!)
    }
    
    // MARK: - core data
    func saveEntry() {
        
        if entryTextView.text.count > 0 {
            
            //lets us access core data
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let timeline = NSEntityDescription.insertNewObject(forEntityName: "Timeline", into: context) as! Timeline
            
            //pass values to core data
            timeline.entry = entryTextView.text
            timeline.date = currentDate as NSDate?
            timeline.mood = selectedMood
            
            if let locationText = locationLabel.text {
                timeline.location = locationText
            }
            
            //save to core data
            appDelegate.saveContext()
            
     }
     
     // Core Data Path
     let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
     print("Core Data Path:\n \(path)")
     
     let _ = navigationController?.popToRootViewController(animated: true)
     
       
    }
}
    

