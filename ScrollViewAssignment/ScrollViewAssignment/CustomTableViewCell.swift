//
//  customTableViewCell.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 11.08.2021.
//

import UIKit

//protocol CustomTableViewCellDelegate: AnyObject {
//    func minusAction (cell: CustomTableViewCell)
//    func plusAction (cell: CustomTableViewCell)
//}

class CustomTableViewCell: UITableViewCell {
    
//    weak var delegate: CustomTableViewCellDelegate?
    
    @IBOutlet weak var imageOfCell: UIImageView!
    @IBOutlet weak var headerLabelOfCell: UILabel!
    @IBOutlet weak var lowerLabelOfCell: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    func itemForCell(item: ShopItem) {
        imageOfCell.image = UIImage(named: item.nameOfimage)
        headerLabelOfCell.text = item.name
        lowerLabelOfCell.text = item.description
    }
    
    var complation: ((_ : Any) -> ())?
    
    @IBAction func minusButton(_ sender: Any) {
        complation?(sender)
//        delegate?.minusAction(cell: self)
    }
    @IBAction func plusButton(_ sender: Any) {
        complation?(sender)
//        delegate?.plusAction(cell: self)
    }
}
