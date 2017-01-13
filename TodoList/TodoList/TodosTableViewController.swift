//
//  TodosTableViewController.swift
//  TodoList
//
//  Created by Auriles El Haddad on 29/12/2016.
//  Copyright © 2016 Auriles El Haddad. All rights reserved.
//

import UIKit

// MARK - Variables
var todos : [String] = []

class TodosTableViewController: UITableViewController, TodosViewControllerDelegate {
    
    // MARK - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todos = ["aller chez le dentiste","faire les courses","payer les factures"]
    }
    
    // MARK - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        cell.textLabel?.text = todos[indexPath.row]
        
        return cell
    }
    
    // TableViewController Delegate
    
    func TodoAjouter(sender: ViewController, todo:String) {
        todos.append(todo)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "ajouterTodo") {
            
            let viewVC = segue.destination as! ViewController
            viewVC.delegate = self
        }
    }
}
