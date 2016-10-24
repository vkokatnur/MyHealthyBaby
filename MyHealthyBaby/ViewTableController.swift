//
//  ViewTableController.swift
//  MyHealthyBaby
//
//  Created by Daniel Gonzalez on 10/22/16.
//  Copyright © 2016 Daniel Gonzalez. All rights reserved.
//

// As part of Model-View-Controller programing, an UITableView object must have a delegate to manage apperance and behavior of table view and a data source to mediate between the apps data model (model) and the table view.

// A table view displays a list of items in a single column.
// A table view is made up of zero or more sections, each with its own rows. Sections are identified by their index number within the table view, and rows are identified by their index number within a section. Any section can optionally be preceded by a section header, and optionally be followed by a section footer.

import UIKit

class ViewTableController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    var items: [Journal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // get the data from core data
        getData()
        // reload the table view
        tableView.reloadData()
    }
    
    // Tells the data source to return the number of rows in a given section of a table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    // Load an Array Element into Table View. (string type - CodeDate = action)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        let date = String(describing: self.items[indexPath.row].date)
        let poop = String(self.items[indexPath.row].poop)
        let pee = String(self.items[indexPath.row].pee)
        let breast = String(self.items[indexPath.row].breast)
        let bottle = String(self.items[indexPath.row].bottle)
  
        cell.textLabel?.text = ("Date:\(date), Poop:\(poop), Pee:\(pee), breast:\(breast), Bottle:\(bottle)")
        print ("DEBUG: tableViewCell - Date:\(date), Poop:\(poop), Pee:\(pee), breast:\(breast), Bottle:\(bottle)")
        
        return cell
    }
    
    // Select A Row.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    // Get data from CoreData into an Array of items type Journal.
    func getData() {
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            items = try context.fetch(Journal.fetchRequest())
        } catch {
            print("fetching failed")
        }
    }

}
