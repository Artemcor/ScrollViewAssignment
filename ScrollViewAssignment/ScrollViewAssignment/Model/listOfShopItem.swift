//
//  listOfShopItem.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 12.08.2021.
//

import Foundation

struct ListOfShopItem {
    
    var listOfItem: [ShopItem] = []
    
    private let nameOfItem = ["Glasses", "Desert", "Camera Lens"]
    private let descriptionOfItem = ["This is the best Glasses \n I'he ever seen", "This is so yummy", "I wish I had this \ncamera lens"]
    private let nameOfImageOfItem = ["Glasses", "Dessert", "Camera lens"]
    
    mutating func minesQuantity(for item: Int) {
        if listOfItem[item].quantity > 0 {
            listOfItem[item].quantity -= 1
        }
    }
    
    mutating func plusQuantity(for item: Int) {
        listOfItem[item].quantity += 1
    }
    
    init() {
        for index in 0...2 {
            listOfItem.append(ShopItem(name: nameOfItem[index], description: descriptionOfItem[index], nameOfimage: nameOfImageOfItem[index]))
        }
        print(listOfItem)
    }
}
