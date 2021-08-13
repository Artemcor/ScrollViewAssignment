//
//  CustomTableViewCell.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 11.08.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    func setupCell(with item: ShopItem) {
        productImageView.image = UIImage(named: item.nameOfimage)
        nameLabel.text = item.name
        descriptionLabel.text = item.description
    }
    
    var complation: ((_ isPlusAction : Bool) -> (String))?
    
    @IBAction func minusButton(_ sender: Any) {
        countLabel.text = complation?(false)
    }
    @IBAction func plusButton(_ sender: Any) {
        countLabel.text = complation?(true)
    }
}
