//
//  ViewController.swift
//  LasVegasCasino
//
//  Created by Auriles El Haddad on 12/01/2017.
//  Copyright © 2017 Auriles El Haddad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK - Outlets
    @IBOutlet weak var lasVegasLabel: UILabel!
    
    @IBOutlet weak var casinoRoulettePickerView: UIPickerView!
    
    
    
    
    // MARK - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lasVegasLabel.text = "Las Vegas \nCasino"
        casinoRoulettePickerView.dataSource = self
        casinoRoulettePickerView.delegate = self
        
    }
    
    // MARK - UIPickerViewDataSource
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    
    // MARK - UIPickerViewDataSource
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }

    


}

