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
    
    // MARK - Format Date
    
    func formatterDate(_ date:Date) -> String {
        
        var dateStr:String?
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd, yyyy"
        dateStr = dateFormatter.string(from: date)
        
        return dateStr!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        AjouterDatePickerView()
        
        if isTodoEditing {
            
            todoTextField.text = todo?["todo"] as? String
            dateTextField.text = formatterDate(todo?["date"] as! Date)
        } else {
            
            todoTextField.text = ""
            dateTextField.text = ""
        }
        
    }
    
    
    
    
}

