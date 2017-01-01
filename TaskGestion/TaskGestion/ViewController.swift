//
//  ViewController.swift
//  TaskGestion
//
//  Created by Auriles El Haddad on 01/01/2017.
//  Copyright © 2017 Auriles El Haddad. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var todoTextField: UITextField!
    
    @IBOutlet weak var ajouterBtn: UIBarButtonItem!
    
    var context:NSManagedObjectContext?
    
    // Actions
    
    @IBAction func annuler(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ajouterTodo(_ sender: UIBarButtonItem) {
        
        ajouterTodoAFaire(todo: todoTextField!.text!, date: Date())
        dismiss(animated: true, completion: nil)
    }
    
    func ajouterTodoAFaire(todo:String, date:Date) {
        
        let nouveauTodo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context!)
        
        nouveauTodo.setValue(todo, forKey: "todo")
        nouveauTodo.setValue(date, forKey: "date")
        nouveauTodo.setValue(false, forKey: "estFait")
        
        do {
            try context?.save()
            print("sauvegarde aboutie pour \(nouveauTodo)")
        } catch {
            print("erreur sauvegarde au Model")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

