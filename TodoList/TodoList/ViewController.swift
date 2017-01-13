//
//  ViewController.swift
//  TodoList
//
//  Created by Auriles El Haddad on 29/12/2016.
//  Copyright © 2016 Auriles El Haddad. All rights reserved.
//

import UIKit

protocol TodosViewControllerDelegate :class {
    func TodoAjouter(sender: ViewController, todo:String)
}

class ViewController: UIViewController {
    
    // MARK - Variables
    var delegate: TodosViewControllerDelegate?
    
    // MARK - Outlets
    @IBOutlet weak var todoTextField: UITextField!
    
    // MARK - Actions
    @IBAction func annulerAjouterTodo(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func ajouterTodoAction(_ sender: UIBarButtonItem) {
        
        delegate?.TodoAjouter(sender: self, todo: todoTextField.text!)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

