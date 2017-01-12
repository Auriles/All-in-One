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
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    
    // MARK - UIPickerViewDataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    // MARK - Hauteur
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.00
    }
    
    // MARK - Largeur
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.00
    }
    
    // MARK - Nombre de colonnes
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel: UILabel = UILabel()
        
        switch component {
        case 0:
            pickerLabel.text = "\(row)"
        case 1:
            pickerLabel.text = "\(row)"
        case 2:
            pickerLabel.text = "\(row)"
        default:
            pickerLabel.text = ""
        }
        
        pickerLabel.font = UIFont(name: "Arial", size: 40)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }
    
    
    
}





















