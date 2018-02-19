//
//  MoodTableViewCell.swift
//  MoodTracker
//
//  Created by Rimil Dey on 18/02/18.
//  Copyright © 2018 Rimil Dey. All rights reserved.
//

import UIKit

class MoodTableViewCell: UITableViewCell {

    // MARK: - when cell loads
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedImageView.layer.cornerRadius = selectedImageView.frame.width * 0.1
        selectedImageView.layer.masksToBounds = true
        self.layoutIfNeeded()
    }

    // MARK: - outlets
    
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var selectedEntryLabel: UILabel!
    @IBOutlet weak var selectedLocationLabel: UILabel!
    
}
