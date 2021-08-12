//
//  ViewController.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 10.08.2021.
//

import UIKit

class TableViewController: UITableViewController, CustomTableViewCellDelegate {
    
    var shoppingItems = [ShopItem(name: "Glasses", description: "This is the best Glasses \n I'he ever seen", nameOfimage: "Glasses"),
                         ShopItem(name: "Dessert", description: "This is so yummy", nameOfimage: "Dessert"),
                         ShopItem(name: "Camera Lens", description: "I wish I had this \ncamera lens", nameOfimage: "Camera lens")]
    
    func minusAction(cell: CustomTableViewCell) {
        if let index = tableView.indexPath(for: cell) {
            if shoppingItems[index.row].quantity > 0 {
                shoppingItems[index.row].quantity -= 1
                let item = shoppingItems[index.row]
                cell.countLabel.text = String(item.quantity)
            }
        }
    }
    
    func plusAction(cell: CustomTableViewCell) {
        if let index = tableView.indexPath(for: cell) {
            shoppingItems[index.row].quantity += 1
            let item = shoppingItems[index.row]
            cell.countLabel.text = String(item.quantity)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowOfItem", for: indexPath)
        if let customCell = cell as? CustomTableViewCell {
            let item = shoppingItems[indexPath.row]
            customCell.headerLabelOfCell.text = item.name
            customCell.lowerLabelOfCell.text = item.description
            customCell.imageOfCell?.image = UIImage(named: item.nameOfimage)
            customCell.delegate = self
//            customCell.complationForPlus = { [weak self] cell in
//                let customCell = cell as? CustomTableViewCell
//                shoppingItems.
//                customCell?.countLabel =
                
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCell" {
            if let cvc = segue.destination as? ShowCellViewController {
                if let cell = sender as? CustomTableViewCell {
                    if let index = tableView.indexPath(for: cell){
                        let item = shoppingItems[index.row]
                        cvc.itemOfSEcondVC = item
                    }
                }
            }
        }
    }
}

