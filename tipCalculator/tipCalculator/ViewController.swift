//
//  ViewController.swift
//  tipCalculator
//
//  Created by Auriles El Haddad on 15/12/2016.
//  Copyright © 2016 Auriles El Haddad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK - Variables
    var pourcentagePourboire:Int?
    
    // MARK - Outlets
    @IBOutlet weak var montantFactureTextField: UITextField!
    @IBOutlet weak var pourboireSegmentedControl: UISegmentedControl!
    @IBOutlet weak var pourboireLabel: UILabel!
    @IBOutlet weak var montantTotalLabel: UILabel!
    
    // MARK - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pourboireSegmentedControl.addTarget(self, action: #selector(ViewController.calculerPourcentage), for: UIControlEvents.valueChanged)
        
        montantFactureTextField.delegate = self
        montantFactureTextField.becomeFirstResponder()
    }
    
    // MARK - Fonction calculer pourcentage
    func calculerPourcentage() {
        
        switch pourboireSegmentedControl.selectedSegmentIndex {
            
        case 0:
            print("segment sélectionné : \(pourboireSegmentedControl.selectedSegmentIndex)")
            pourcentagePourboire = 15
            
        case 1:
            print("segment sélectionné : \(pourboireSegmentedControl.selectedSegmentIndex)")
            pourcentagePourboire = 20
            
        case 2:
            print("segment sélectionné : \(pourboireSegmentedControl.selectedSegmentIndex)")
            pourcentagePourboire = 25
            
        default:
            print("Aucune sélection")
        }
        
        calculerPourboire(pourcent: Float(pourcentagePourboire!))
        
    }
    
    // MARK - Fonction calculer pourboire
    func calculerPourboire(pourcent:Float) {
        
        let pourboire = Float(montantFactureTextField.text!)! * pourcent / 100
        
        let montant = Float(montantFactureTextField.text!)
        
        let pourboireFormatStr = NSString(format : "%.2f", pourboire)
        
        let montantTotalFormatStr = NSString(format : "%.2f", pourboire + montant!)
        
        pourboireLabel.text = "€ \(pourboireFormatStr)"
        montantTotalLabel.text = "€ \(montantTotalFormatStr)"
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        montantFactureTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
}

