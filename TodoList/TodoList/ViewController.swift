//
//  ViewController.swift
//  TodoList
//
//  Created by Auriles El Haddad on 29/12/2016.
//  Copyright © 2016 Auriles El Haddad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func annulerAjouterTodo(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ajouterTodoAction(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
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

