//
//  Entries+CoreDataProperties.swift
//  MoodTracker
//
//  Created by Rimil Dey on 19/02/18.
//  Copyright © 2018 Rimil Dey. All rights reserved.
//
//

import Foundation
import CoreData


extension Entries {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entries> {
        return NSFetchRequest<Entries>(entityName: "Entries")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var location: String?
    @NSManaged public var entry: String?
    @NSManaged public var mood: NSData?

}
