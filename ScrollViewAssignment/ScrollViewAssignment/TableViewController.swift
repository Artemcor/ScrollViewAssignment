//
//  ViewController.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 10.08.2021.
//

import UIKit

class TableViewController: UITableViewController, CustomTableViewCellDelegate {
    
    func minusAction(count: Int, cell: CustomTableViewCell) {
        cell.countLabel.text = String(count)
    }
    
    func plusAction(count: Int, cell: CustomTableViewCell) {
        cell.countLabel.text = String(count)

    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowOfItem", for: indexPath)
        if let customCell = cell as? CustomTableViewCell {
            customCell.headerLabelOfCell.text = headerLabel(at: indexPath)
            customCell.lowerLabelOfCell.text = lowerLabelOfCell(at: indexPath)
            customCell.imageOfCell?.image = imageOfCell(at: indexPath)
            customCell.delegate = self

        }
        return cell
    }
    
    func headerLabel(at index: IndexPath) -> String {
        let row = index.row
        let titles = ["Glasses", "Desert", "Camera Lens"]
        return titles[row]
    }
    
    func lowerLabelOfCell(at index: IndexPath) -> String {
        let row = index.row
        let titles = ["This is the best Glasses \n I'he ever seen", "This is so yummy", "I wish I had this \ncamera lens"]
        return titles[row]
    }
    
    func imageOfCell(at index: IndexPath) -> UIImage? {
        return  UIImage(named: String(index.row)) ?? nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCell" {
            if let cvc = segue.destination as? ShowCellViewController {
                cvc.headerLabelOfSecondVC = "fgdfg"
                if let cell = sender as? CustomTableViewCell {
                    if let index = tableView.indexPath(for: cell){
                    cvc.headerLabelOfSecondVC = headerLabel(at: index)
                        cvc.lowerLabelOfSecondVC = lowerLabelOfCell(at: index)
                        cvc.imageOfSecondVC = imageOfCell(at: index)
                        
                    }
                }
                
                
            }
        }
    }
}

