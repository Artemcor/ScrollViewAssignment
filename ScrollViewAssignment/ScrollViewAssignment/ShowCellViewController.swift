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
    
    var headerLabelOfSecondVC: String?
    var lowerLabelOfSecondVC: String?
    var imageOfSecondVC: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = headerLabelOfSecondVC ?? ""
        lowerLabel.text = lowerLabelOfSecondVC ?? ""
        image.image = imageOfSecondVC

        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
