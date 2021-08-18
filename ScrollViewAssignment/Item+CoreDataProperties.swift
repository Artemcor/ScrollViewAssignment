//
//  Item+CoreDataProperties.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 18.08.2021.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: Int64
    @NSManaged public var openingCrawl: String?
    @NSManaged public var director: String?
    @NSManaged public var producer: String?
    @NSManaged public var releaseDate: String?

}

extension Item : Identifiable {

}
