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
    
    var completion: ((_ isPlusAction : Bool) -> ())?
    
    func setupCell(with item: Film) {
//        productImageView.image = UIImage(named: item.nameOfimage)
        nameLabel.text = item.titleLabelText
        descriptionLabel.text = item.subtitleLabelText  
//        countLabel.text = String(item.quantity)
    }
        
    @IBAction func minusButton(_ sender: Any) {
        completion?(false)
    }
    
    @IBAction func plusButton(_ sender: Any) {
        completion?(true)
    }
}
