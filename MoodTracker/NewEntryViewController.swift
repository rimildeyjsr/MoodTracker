//
//  NewEntryViewController.swift
//  MoodTracker
//
//  Created by Rimil Dey on 18/02/18.
//  Copyright © 2018 Rimil Dey. All rights reserved.
//

import UIKit

class NewEntryViewController: UIViewController {

    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        entryTextView.inputAccessoryView = toolbar
        entryTextView.becomeFirstResponder()
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
    }
    
    
   

}
