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

}
