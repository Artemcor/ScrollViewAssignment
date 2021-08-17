//
//  TableViewController.swift
//  ScrollViewAssignment
//
//  Created by Стожок Артём on 10.08.2021.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
//    lazy var choosingItems: [ShopItem] = {
//        var items: [ShopItem] = []
//        let fetchedItems: [Item]
//        try! fetchedItems = context.fetch(Item.fetchRequest())
//        for element in fetchedItems {
//            let item = ShopItem(name: element.wrappedName, description: element.wrappedDescription, nameOfimage: element.wrappedImage, quantity: Int(element.quantity))
//            items.append(item)
//        }
//        return items
//    }()
    
    var items: [Film] = []
     
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFilms()
    }
    
//    @IBAction func addItem(_ sender: UIBarButtonItem) {
//        if let item = shoppingItems.randomElement() {
//            choosingItems.append(item)
//            tableView.reloadData()
//        }
//    }
    
//    @IBAction func saveTable(_ sender: UIBarButtonItem) {
//        try! context.execute(Item.deleteRequest)
//        for item in choosingItems {
//            let savedItem = Item(context: context)
//            savedItem.name = item.name
//            savedItem.descriptionOfItem = item.description
//            savedItem.image = item.nameOfimage
//            savedItem.quantity = Int64(item.quantity)
//            try! context.save()
//        }
//    }
    
    override func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowOfItem", for: indexPath)
        if let customCell = cell as? CustomTableViewCell {
            let item = items[indexPath.row]
            customCell.setupCell(with: item)
//            customCell.completion = { [weak self] isPlusAction in
//                guard let strongSelf = self else {
//                    return
//                }
//                if isPlusAction {
//                    strongSelf.choosingItems[indexPath.row].quantity += 1
//                    customCell.setupCell(with: (strongSelf.choosingItems[indexPath.row]))
//                } else {
//                    if (strongSelf.choosingItems[indexPath.row].quantity) > 0 {
//                        strongSelf.choosingItems[indexPath.row].quantity -= 1
//                    }
//                    customCell.setupCell(with: (strongSelf.choosingItems[indexPath.row]))
//                }
//            }
          }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCell" {
            if let cvc = segue.destination as? ShowCellViewController {
                if let cell = sender as? CustomTableViewCell {
                    if let index = tableView.indexPath(for: cell){
                        let item = items[index.row]
                        cvc.shopItem = item
                    }
                }
            }
        }
    }
}

extension TableViewController {
    func fetchFilms() {
        AF.request("https://swapi.dev/api/films").validate().responseDecodable(of: Films.self) { (response) in
            guard let films = response.value else {
                return
            }
            self.items = films.all
            self.tableView.reloadData()
        }
    }
}

