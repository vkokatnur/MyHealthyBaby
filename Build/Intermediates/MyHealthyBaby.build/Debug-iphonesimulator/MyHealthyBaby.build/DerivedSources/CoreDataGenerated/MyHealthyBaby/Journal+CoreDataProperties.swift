//
//  Journal+CoreDataProperties.swift
//  
//
//  Created by Vijay Kokatnur on 10/23/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Journal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Journal> {
        return NSFetchRequest<Journal>(entityName: "Journal");
    }

    @NSManaged public var bottle: Double
    @NSManaged public var breast: Double
    @NSManaged public var date: NSDate?
    @NSManaged public var id: String?
    @NSManaged public var pee: Bool
    @NSManaged public var poop: Bool
    @NSManaged public var baby: Baby?

}
