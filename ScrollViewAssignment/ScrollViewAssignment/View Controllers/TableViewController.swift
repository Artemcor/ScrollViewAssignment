//
//  TableViewController.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 10.08.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var choosingItems: [ShopItem] = []
    
    var shoppingItems = [ShopItem(name: "Glasses", description: "This is the best Glasses \n I'he ever seen", nameOfimage: "Glasses"),
                         ShopItem(name: "Dessert", description: "This is so yummy", nameOfimage: "Dessert"),
                         ShopItem(name: "Camera Lens", description: "I wish I had this \ncamera lens", nameOfimage: "Camera lens"),
                         ShopItem(name: "Phone", description: "Leader of industry", nameOfimage: "Phone"),
                         ShopItem(name: "Pan", description: "Cook your best dish", nameOfimage: "Pan"),
                         ShopItem(name: "Pen", description: "For best writers", nameOfimage: "Pen"),
                         ShopItem(name: "Strawberry", description: "Delicious!!!", nameOfimage: "Strawberry"),
                         ShopItem(name: "Ball", description: "If you love football", nameOfimage: "Ball"),
                         ShopItem(name: "Skateboard", description: "Better than BMX", nameOfimage: "Skateboard")]
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        guard shoppingItems.count > 0 else {
            return
        }
        let newRowIndex = choosingItems.count
        choosingItems.append(shoppingItems.remove(at: shoppingItems.count.random))
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return choosingItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowOfItem", for: indexPath)
        if let customCell = cell as? CustomTableViewCell {
            let item = choosingItems[indexPath.row]
            customCell.setupCell(with: item)
            customCell.completion = { [weak self] isPlusAction in
                guard (self != nil) else {
                    return
                }
                if isPlusAction {
                    self?.choosingItems[indexPath.row].quantity += 1
                        customCell.setupCell(with: (self?.choosingItems[indexPath.row])!)
                } else {
                    if (self?.choosingItems[indexPath.row].quantity)! > 0 {
                        self?.choosingItems[indexPath.row].quantity -= 1
                    }
                    customCell.setupCell(with: (self?.choosingItems[indexPath.row])!)
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
                        let item = choosingItems[index.row]
                        cvc.shopItem = item
                    }
                }
            }
        }
    }
}

extension Int {
    var random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

