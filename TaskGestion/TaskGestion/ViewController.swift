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
    
    // Variables
    
    var context:NSManagedObjectContext?
    var datePickerView:UIDatePicker?
    var dateTodo:Date?
    var isTodoEditing:Bool = false
    var todo:NSDictionary?
    
    // Actions
    
    @IBAction func annuler(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ajouterTodo(_ sender: UIBarButtonItem) {
        ajouterTodoAFaire(todo: todoTextField!.text!, date: dateTodo!)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func modifierTodo(_ sender: UIBarButtonItem) {
        
        modifierTodoExistant(todo: todo?["todo"] as! String, date: dateTodo!)
        self.navigationController?.popViewController(animated: true)
    }
    
    // Mark - Date Picker view
    
    func AjouterDatePickerView() {
        
        datePickerView = UIDatePicker()
        datePickerView?.datePickerMode = UIDatePickerMode.date
        datePickerView?.addTarget(self, action: #selector(ViewController.selectionDate(_:)), for: .valueChanged)
        
        dateTextField.inputView = datePickerView
    }
    
    func selectionDate(_ sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd, yyyy"
        dateTextField.text = dateFormatter.string(from: sender.date)
        dateTodo = sender.date
    }
    
    // Mark - Core Data
    
    // Ajouter Todo
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
    
    // Modifier Todo
    func modifierTodoExistant(todo:String, date:Date) {
        
        fetchTodos(todo) { (array, arrayData) in
            
            arrayData.setValue(todoTextField!.text, forKey: "todo")
            arrayData.setValue(date, forKey: "date")
            
            do {
                try context?.save()
                print("modification aboutie pour \(todo)")
            } catch {
                print("erreur modification au Model")
            }
        }
    }
    
    
    // Lire Todo
    func fetchTodos(_ predicate:String, completion:(_ array:NSArray, _ arrayData:NSArray) -> ()) {
        
        var arr = [NSDictionary]()
        var arrData = [NSManagedObject]()
        let requete:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest (entityName: "Todo")
        
        // Modifier
        requete.predicate = NSPredicate(format: "todo = %@", predicate)
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        AjouterDatePickerView()
        
        if isTodoEditing {
            
            todoTextField.text = todo?["todo"] as? String
            dateTextField.text = formatterDate(todo?["date"] as! Date)
            dateTodo = dateFromStr(dateTextField.text!) as Date
            
        } else {
            
            todoTextField.text = ""
            dateTextField.text = ""
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
    
    func dateFromStr(_ dateStr: String) -> Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM dd, yyyy"
        let date = formatter.date(from: dateStr)
        
        return date!
    }
    
    
    
}

