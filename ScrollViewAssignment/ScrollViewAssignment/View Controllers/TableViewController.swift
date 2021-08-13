//
//  TableViewController.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 10.08.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var shoppingItems = [ShopItem(name: "Glasses", description: "This is the best Glasses \n I'he ever seen", nameOfimage: "Glasses"),
                         ShopItem(name: "Dessert", description: "This is so yummy", nameOfimage: "Dessert"),
                         ShopItem(name: "Camera Lens", description: "I wish I had this \ncamera lens", nameOfimage: "Camera lens")]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowOfItem", for: indexPath)
        if let customCell = cell as? CustomTableViewCell {
            let item = shoppingItems[indexPath.row]
            customCell.setupCell(with: item)
            customCell.completion = { [weak self] isPlusAction in
                if isPlusAction {
                    self?.shoppingItems[indexPath.row].quantity += 1
                        customCell.setupCell(with: (self?.shoppingItems[indexPath.row])!)
                    
                } else {
                    if (self?.shoppingItems[indexPath.row].quantity)! > 0 {
                        self?.shoppingItems[indexPath.row].quantity -= 1
                        customCell.setupCell(with: (self?.shoppingItems[indexPath.row])!)
                    }
                }
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCell" {
            if let cvc = segue.destination as? ShowCellViewController {
                if let cell = sender as? CustomTableViewCell {
                    if let index = tableView.indexPath(for: cell){
                        let item = shoppingItems[index.row]
                        cvc.shopItem = item
                    }
                }
            }
        }
    }
}

