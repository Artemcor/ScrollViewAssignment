//
//  customTableViewCell.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 11.08.2021.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func minusAction (cell: CustomTableViewCell)
    func plusAction (cell: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {
    
    weak var delegate: CustomTableViewCellDelegate?
    
    @IBOutlet weak var imageOfCell: UIImageView!
    @IBOutlet weak var headerLabelOfCell: UILabel!
    @IBOutlet weak var lowerLabelOfCell: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
//    var complation: ((UITableViewCell) -> ())?
    
    @IBAction func minusButton(_ sender: Any) {
        delegate?.minusAction(cell: self)
    }
    @IBAction func plusButton(_ sender: Any) {
        delegate?.plusAction(cell: self)
    }
}
