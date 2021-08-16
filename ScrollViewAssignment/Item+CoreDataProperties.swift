//
//  Item+CoreDataProperties.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 16.08.2021.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var image: String?
    @NSManaged public var descriptionOfItem: String?
    @NSManaged public var name: String?
    @NSManaged public var quantity: Int64

}

extension Item : Identifiable {

}
