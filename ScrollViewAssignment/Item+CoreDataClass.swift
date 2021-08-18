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
    
    var wrappedTitle: String {
        title ?? "Unknown Title"
    }
    
    var wrappedOpeningCrawl: String {
        openingCrawl ?? "Unknown OpeningCrawl"
    }
    
    var wrappedDirector: String {
        director ?? "Unknown Director"
    }
    
    var wrappedProducer: String {
        producer ?? "Unknown Producer"
    }
    
    var wrappedReleaseDate: String {
        releaseDate ?? "Unknown ReleaseDate"
    }
    

    
    
    
    
}
