//
//  Baby+CoreDataProperties.swift
//  
//
//  Created by Vijay Kokatnur on 10/23/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Baby {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Baby> {
        return NSFetchRequest<Baby>(entityName: "Baby");
    }

    @NSManaged public var birthday: NSDate?
    @NSManaged public var fname: String?
    @NSManaged public var id: Int16
    @NSManaged public var isMale: Bool
    @NSManaged public var lname: String?
    @NSManaged public var journals: Journal?

}
