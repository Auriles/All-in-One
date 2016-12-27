//
//  ViewController.swift
//  tipCalculator
//
//  Created by Auriles El Haddad on 15/12/2016.
//  Copyright © 2016 Auriles El Haddad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var montantFactureTextField: UITextField!
    
    @IBOutlet weak var pourboireSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var pourboireLabel: UILabel!
    
    @IBOutlet weak var montantTotalLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pourboireSegmentedControl.addTarget(self, action: #selector(ViewController.calculerPourboire), for: UIControlEvents.valueChanged)
    }

    func calculerPourboire() {
        print(montantFactureTextField.text!)
    }
    
    
    
    
    
}

