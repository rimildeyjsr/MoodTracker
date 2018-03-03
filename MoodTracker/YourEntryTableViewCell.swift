//
//  YourEntryTableViewCell.swift
//  MoodTracker
//
//  Created by Rimil Dey on 03/03/18.
//  Copyright © 2018 Rimil Dey. All rights reserved.
//

import UIKit

class YourEntryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - outlets
    @IBOutlet weak var dateLocationLabel: UILabel!
    @IBOutlet weak var moodImage: UIImageView!
    @IBOutlet weak var YourEntryLabel: UILabel!
    

}
