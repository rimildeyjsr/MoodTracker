//
//  NewEntryViewController.swift
//  MoodTracker
//
//  Created by Rimil Dey on 18/02/18.
//  Copyright © 2018 Rimil Dey. All rights reserved.
//

import UIKit

class NewEntryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        entryTextView.becomeFirstResponder()
        
    }
    @IBOutlet weak var entryTextView: UITextView!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
