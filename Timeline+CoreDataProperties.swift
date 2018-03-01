//
//  Timeline+CoreDataProperties.swift
//  MoodTracker
//
//  Created by Rimil Dey on 20/02/18.
//  Copyright © 2018 Rimil Dey. All rights reserved.
//
//

import Foundation
import CoreData


extension Timeline {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Timeline> {
        return NSFetchRequest<Timeline>(entityName: "Timeline")
    }

    @NSManaged public var entry: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var location: String?
    @NSManaged public var mood: String?

}
