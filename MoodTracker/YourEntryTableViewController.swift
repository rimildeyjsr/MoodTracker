//
//  YourEntryTableViewController.swift
//  MoodTracker
//
//  Created by Rimil Dey on 03/03/18.
//  Copyright © 2018 Rimil Dey. All rights reserved.
//

import UIKit
import CoreData

class YourEntryTableViewController: UITableViewController,NSFetchedResultsControllerDelegate {

    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFetchedResultsController()
    }
    
    // MARK: - properties
    var selectedIndexPath = IndexPath()
    
    // MARK: - core data
    let context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    
    func initializeFetchedResultsController() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Timeline")
        let sortByDate = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sortByDate]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func configureCell(cell: UITableViewCell, indexPath: IndexPath) {
        let timeline = fetchedResultsController.object(at: selectedIndexPath) as! Timeline
        let cell = cell as! YourEntryTableViewCell
        let dateformmater = DateFormatter()
        dateformmater.dateStyle = .long
        var dateContent: String?
        
        if let date = timeline.date {
            dateContent = dateformmater.string(from: date as Date)
        }
        
        if let locationContent = timeline.location {
            if locationContent == "" {
                cell.dateLocationLabel.text = "\(dateContent!)"
            } else {
                cell.dateLocationLabel.text = "\(dateContent!) at \(locationContent)"
            }
            
        }
        
        cell.YourEntryLabel.text = timeline.entry!
        
        if let imageString = timeline.mood {
            cell.moodImage.image = UIImage(named: imageString)
        } else {
            cell.moodImage.image = UIImage(named: "question mark")
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "yourEntryCell", for: indexPath) as! YourEntryTableViewCell
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    // MARK: - UItableview delegate
    
    
 

}
