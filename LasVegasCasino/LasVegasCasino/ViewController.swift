//
//  ViewController.swift
//  LasVegasCasino
//
//  Created by Auriles El Haddad on 12/01/2017.
//  Copyright © 2017 Auriles El Haddad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lasVegasLabel: UILabel!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lasVegasLabel.text = "Las Vegas \nCasino"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

