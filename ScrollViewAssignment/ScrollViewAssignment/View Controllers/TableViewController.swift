//
//  TableViewController.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 10.08.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var choosingItems: [ShopItem] = []
    
    var shoppingItems = [ShopItem(name: "Glasses", description: "This is the best Glasses \n I'he ever seen", nameOfimage: "Glasses"),
                         ShopItem(name: "Dessert", description: "This is so yummy", nameOfimage: "Dessert"),
                         ShopItem(name: "Camera Lens", description: "I wish I had this \ncamera lens", nameOfimage: "Camera lens"),
                         ShopItem(name: "Phone", description: "Leader of industry", nameOfimage: "Phone"),
                         ShopItem(name: "Pan", description: "Cook your best dish", nameOfimage: "Pan"),
                         ShopItem(name: "Pen", description: "For best writers", nameOfimage: "Pen"),
                         ShopItem(name: "Strawberry", description: "Delicious!!!", nameOfimage: "Strawberry"),
                         ShopItem(name: "Ball", description: "If you love football", nameOfimage: "Ball"),
                         ShopItem(name: "Skateboard", description: "Better than BMX", nameOfimage: "Skateboard")]
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchItem()
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        if let item = shoppingItems.randomElement() {
            choosingItems.append(item)
            tableView.reloadData()
        }
    }
    
    @IBAction func SaveTable(_ sender: UIBarButtonItem) {
        try! context.execute(Item.deleteRequest)
        for item in choosingItems {
            let savedItem = Item(context: context)
            savedItem.name = item.name
            savedItem.descriptionOfItem = item.description
            savedItem.image = item.nameOfimage
            savedItem.quantity = Int64(item.quantity)
            try! context.save()
        }
    }
    
    func fetchItem() {
        let fetchedItems: [Item]
        try! fetchedItems = context.fetch(Item.fetchRequest())
        for element in fetchedItems {
            let item = ShopItem(name: element.name!, description: element.descriptionOfItem!, nameOfimage: element.image!, quantity: Int(element.quantity))
            choosingItems.append(item)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return choosingItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowOfItem", for: indexPath)
        if let customCell = cell as? CustomTableViewCell {
            let item = choosingItems[indexPath.row]
            customCell.setupCell(with: item)
            customCell.completion = { [weak self] isPlusAction in
                guard let strongSelf = self else {
                    return
                }
                if isPlusAction {
                    strongSelf.choosingItems[indexPath.row].quantity += 1
                    customCell.setupCell(with: (strongSelf.choosingItems[indexPath.row]))
                } else {
                    if (strongSelf.choosingItems[indexPath.row].quantity) > 0 {
                        strongSelf.choosingItems[indexPath.row].quantity -= 1
                    }
                    customCell.setupCell(with: (strongSelf.choosingItems[indexPath.row]))
                }
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCell" {
            if let cvc = segue.destination as? ShowCellViewController {
                if let cell = sender as? CustomTableViewCell {
                    if let index = tableView.indexPath(for: cell){
                        let item = choosingItems[index.row]
                        cvc.shopItem = item
                    }
                }
            }
        }
    }
}

