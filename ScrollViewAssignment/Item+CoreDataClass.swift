//
//  Item+CoreDataClass.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 16.08.2021.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    
    static let deleteRequest = NSBatchDeleteRequest(fetchRequest: Item.fetchRequest())
    
    var wrappedName: String {
        name ?? "Unknown name"
    }
    
    var wrappedDescription: String {
        descriptionOfItem ?? "Unknown description"
    }
    
    var wrappedImage: String {
        image ?? "Unknown name of image"
    }

}
