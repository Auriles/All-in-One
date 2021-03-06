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
    
    // MARK - Variables
    var context:NSManagedObjectContext?
    var todos:[NSDictionary] = [NSDictionary]()
    
    // MARK - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    }
    
    // MARK - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchTodos("") { (array, arrayData) in
            todos = array as! [NSDictionary]
            tableView.reloadData()
        }
    }
    
    // MARK - Fonction format date
    func formatterDate(_ date:Date) -> String {
        
        var dateStr:String?
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "dd / MM / yyyy"
        dateStr = dateFormatter.string(from: date)
        
        return dateStr!
    }
    
    
    // MARK  - Fonction Core Data
    func fetchTodos(_ predicate:String, completion :(_ array:NSArray,_ arrayData:NSArray) -> ()) {
        
        var arr = [NSDictionary]()
        var arrData = [NSManagedObject]()
        let requete:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Todo")
        
        do {
            
            let resultats = try context!.fetch(requete)
            
            for resultat in resultats {
                
                let todo = (resultat as AnyObject).value(forKey: "todo")
                let date = (resultat as AnyObject).value(forKey: "date")
                let fait = (resultat as AnyObject).value(forKey: "estFait")
                
                let todoDict = ["todo": todo, "date": date, "estFait": fait] as [String:Any]
                
                arr.append(todoDict as NSDictionary)
                arrData.append(resultat as! NSManagedObject)
            }
            
            completion(arr as NSArray, arrData as NSArray)
            
        } catch {
            
            print("erreur requête")
        }
        
    }
    
    // MARK - Fonction supprimer todo
    func supprimerTodo(todo:String) {
        
        fetchTodos(todo) { (array, arrayData) in
            
            for resultat in arrayData {
                
                let unTodo = (resultat as AnyObject).value(forKey: "todo") as! String
                
                if unTodo == todo {
                    
                    context?.delete(resultat as! NSManagedObject)
                    
                    // MARK - Sauvegarder
                    do {
                        try context?.save()
                        print("\(todo) supprimé")
                    } catch {
                        print("erreur suppression todo")
                    }
                    
                    
                }
            }
        }
        
    }
    
    // MARK - Fonction barrer todo
    func barrerTodo(_ todo:String, cell:UILabel) {
        
        let attributs = [
            NSFontAttributeName: UIFont(name: "Arial", size: 17.0)!,
            NSForegroundColorAttributeName: UIColor.init(red: 178/255.0, green: 180/255.0, blue: 209/255.0, alpha: 1),
            NSStrikethroughStyleAttributeName: NSNumber(value: NSUnderlineStyle.styleSingle.rawValue)
        ]
        
        let stringFormatted = NSAttributedString(string: todo, attributes: attributs)
        cell.attributedText = stringFormatted
    }
    
    // MARK - Fonction todo basique
    func normalTodo(_ todo:String, cell:UILabel) {
        let attributs = [
            NSFontAttributeName: UIFont(name: "Arial", size: 17.0)!,
            NSForegroundColorAttributeName: UIColor.black,
            NSStrikethroughStyleAttributeName: NSNumber(value: 0)
        ]
        
        let stringFormatted = NSAttributedString(string: todo, attributes: attributs)
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
            normalTodo(todo["todo"] as! String, cell: cell.textLabel!)
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let todoASupprimer = todos[indexPath.row]["todo"] as! String
            
            supprimerTodo(todo: todoASupprimer)
            
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    // MARK: - Fonction navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let viewVC = segue.destination as! ViewController
        
        if segue.identifier == "ajouterTodo" {
            print("ajouter Todo")
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
