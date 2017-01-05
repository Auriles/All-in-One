//
//  TodosTableViewController.swift
//  TaskGestion
//
//  Created by Auriles El Haddad on 01/01/2017.
//  Copyright © 2017 Auriles El Haddad. All rights reserved.
//

import UIKit
import CoreData

class TodosTableViewController: UITableViewController {
    
    var context:NSManagedObjectContext?
    var todos:[NSDictionary] = [NSDictionary]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchTodos("") {
            (array, arrayData) in todos = (array as? [NSDictionary])!
            tableView.reloadData()
        }
        
    }
    
    // MARK - Format Date
    
    func formatterDate(_ date:Date) -> String {
        
        var dateStr:String?
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd, yyyy"
        dateStr = dateFormatter.string(from: date)
        
        return dateStr!
    }
    
    // MARK - Core Data
    
    func fetchTodos(_ predicate:String, completion:(_ array:NSArray, _ arrayData:NSArray) -> ()) {
        
        var arr = [NSDictionary]()
        var arrData = [NSManagedObject]()
        let requete:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest (entityName: "Todo")
        
        do {
            let resultats = try context!.fetch(requete)
            
            for resultat in resultats {
                
                let todo = (resultat as AnyObject).value(forKey: "todo")
                let date = (resultat as AnyObject).value(forKey: "date")
                let fait = (resultat as AnyObject).value(forKey: "estFait")
                
                let todoDict = ["todo":todo, "date": date, "estFait": fait]
                
                arr.append(todoDict as NSDictionary )
                arrData.append(resultat as! NSManagedObject)
            }
            
            completion(arr as NSArray, arrData as NSArray)
            
        } catch {
            
            print("erreur requête")
        }
        
    }
    
    func barrerTodo(_ todo:String, cell: UILabel) {
        let attributs = [
            NSFontAttributeName: UIFont(name: "Arial", size: 17.0),
            NSForegroundColorAttributeName: UIColor.init(red: 178/255.0, green: 180/255.0, blue: 209/255.0, alpha: 1),
            NSStrikethroughColorAttributeName: NSNumber(value: 0)
        ] as [String: Any]
        
        let stringFormatted = NSAttributedString(string:todo, attributes: attributs)
        cell.attributedText = stringFormatted
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let todo = todos[indexPath.row] as NSDictionary
        
        let estFait = todo["estFait"] as? Bool == true

        // Configure the cell...
        cell.textLabel?.text = todo["todo"] as? String
        cell.detailTextLabel?.text = formatterDate(todo["date"] as! Date)
        
        if estFait {
            cell.accessoryType = .checkmark
            barrerTodo(todo["todo"] as! String, cell: cell.textLabel!)
        } else {
            cell.accessoryType = .none
        }
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let viewVC = segue.destination as! ViewController
        
        if segue.identifier == "ajouterTodo" {
          print("ajouterTodo")
            viewVC.isTodoEditing = false
        }
        
        if segue.identifier == "voirDetails" {
            print("voir Todo")
            let indexPath = tableView.indexPathForSelectedRow
            let todoSelected = todos[(indexPath?.row)!] as NSDictionary
            
            viewVC.todo = todoSelected
            viewVC.isTodoEditing = true
        }
    }
    

}
