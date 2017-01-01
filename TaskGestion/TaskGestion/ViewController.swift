//
//  ViewController.swift
//  TaskGestion
//
//  Created by Auriles El Haddad on 01/01/2017.
//  Copyright © 2017 Auriles El Haddad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var todoTextField: UITextField!
    
    @IBOutlet weak var ajouterBtn: UIBarButtonItem!
    
    // Actions
    
    @IBAction func annuler(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ajouterTodo(_ sender: UIBarButtonItem) {
        
        ajouterTodoAFaire(todo: todoTextField!.text!, date: Date())
        dismiss(animated: true, completion: nil)
    }
    
    func ajouterTodoAFaire(todo:String, date:Date) {
        
        print("\(date): à faire: \(todo)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

