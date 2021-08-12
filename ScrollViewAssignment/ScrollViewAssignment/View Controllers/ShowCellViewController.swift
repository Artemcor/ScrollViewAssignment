//
//  ShowCellViewController.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 11.08.2021.
//

import UIKit

class ShowCellViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var lowerLabel: UILabel!
    
    var itemOfSEcondVC: ShopItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemOfSEcondVC {
            headerLabel.text = item.name
            lowerLabel.text = item.description
            image.image = UIImage(named: item.nameOfimage)
        }
    }
}
