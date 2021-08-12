//
//  ViewController.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 10.08.2021.
//

import UIKit

class TableViewController: UITableViewController, CustomTableViewCellDelegate {
            
    var shoppingRange = ListOfShopItem()
    
    func minusAction(cell: CustomTableViewCell) {
        if let index = tableView.indexPath(for: cell) {
            shoppingRange.minesQuantity(for: index.row)
            let item = shoppingRange.listOfItem[index.row]
            cell.countLabel.text = String(item.quantity)
        }
    }
    
    func plusAction(cell: CustomTableViewCell) {
        if let index = tableView.indexPath(for: cell) {
            shoppingRange.plusQuantity(for: index.row)
            let item = shoppingRange.listOfItem[index.row]
            cell.countLabel.text = String(item.quantity)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowOfItem", for: indexPath)
        if let customCell = cell as? CustomTableViewCell {
            let item = shoppingRange.listOfItem[indexPath.row]
            customCell.headerLabelOfCell.text = item.name
            customCell.lowerLabelOfCell.text = item.description
            customCell.imageOfCell?.image = UIImage(named: item.nameOfimage)
            customCell.delegate = self
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCell" {
            if let cvc = segue.destination as? ShowCellViewController {
                if let cell = sender as? CustomTableViewCell {
                    if let index = tableView.indexPath(for: cell){
                        let item = shoppingRange.listOfItem[index.row]
                        cvc.headerLabelOfSecondVC = item.name
                        cvc.lowerLabelOfSecondVC = item.description
                        cvc.imageOfSecondVC = UIImage(named: item.nameOfimage)
                    }
                }
            }
        }
    }
}

