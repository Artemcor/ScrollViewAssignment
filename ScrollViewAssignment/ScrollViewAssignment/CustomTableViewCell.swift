//
//  customTableViewCell.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 11.08.2021.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func minusAction (count: Int, cell: CustomTableViewCell)
    func plusAction (count: Int, cell: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {
    
    weak var delegate: CustomTableViewCellDelegate?
    
    @IBOutlet weak var imageOfCell: UIImageView!
    @IBOutlet weak var headerLabelOfCell: UILabel!
    @IBOutlet weak var lowerLabelOfCell: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func minusButton(_ sender: Any) {
        if count > 0 {
            count -= 1

        }
        delegate?.minusAction(count: count, cell: self)
    }
    @IBAction func plusButton(_ sender: Any) {
        count += 1
        delegate?.plusAction(count: count, cell: self)

    }
    
    var count = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
