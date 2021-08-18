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
    
    private var items: [Film] = []
        
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var isFirstTime = true
        if isFirstTime {
            isFirstTime = false
            fetchFromCoreData()
            if !items.isEmpty {
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        fetchFilms()
    }
    
    @IBAction func saveTable(_ sender: UIBarButtonItem) {
        do {
            try context.execute(Item.deleteRequest)
        } catch let error as NSError {
            print("Could not exute deletion \(error), \(error.userInfo)")
        }
        for item in items {
            let savedItem = Item(context: context)
            savedItem.id = Int64(item.id)
            savedItem.director = item.director
            savedItem.openingCrawl = item.openingCrawl
            savedItem.producer = item.producer
            savedItem.releaseDate = item.releaseDate
            savedItem.title = item.title
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not exute saving \(error), \(error.userInfo)")
            }
        }
    }
    
    private func fetchFromCoreData() {
        var fetchedItems: [Item] = []
        do {
            try fetchedItems = context.fetch(Item.fetchRequest())
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        for element in fetchedItems {
            let item = Film(id: Int(element.id), title: element.wrappedTitle, openingCrawl: element.wrappedOpeningCrawl, director: element.wrappedDirector, producer: element.wrappedProducer, releaseDate: element.wrappedReleaseDate)
            items.append(item)
        }
    }
    
    override func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowOfItem", for: indexPath)
        if let customCell = cell as? CustomTableViewCell {
            let item = items[indexPath.row]
            customCell.setupCell(with: item)
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
    private func fetchFilms() {
        AF.request("https://swapi.dev/api/films").validate().responseDecodable(of: Films.self) { (response) in
            guard let films = response.value else {
                return
            }
            self.items = films.all
            self.tableView.reloadData()
        }
    }
}

