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
    @IBOutlet weak var resultatLabel: UILabel!
    
    // MARK - Actions
    @IBAction func jouerBtnAction(_ sender: UIButton) {
        
        casinoRoulettePickerView.selectRow(randomNumber(num: 100), inComponent: 0, animated: true)
        casinoRoulettePickerView.selectRow(randomNumber(num: 100), inComponent: 1, animated: true)
        casinoRoulettePickerView.selectRow(randomNumber(num: 100), inComponent: 2, animated: true)
        
        if (component0[casinoRoulettePickerView.selectedRow(inComponent: 0)] == component1[casinoRoulettePickerView.selectedRow(inComponent: 0)] && component1[casinoRoulettePickerView.selectedRow(inComponent: 0)] == component2[casinoRoulettePickerView.selectedRow(inComponent: 1)]) {
            
            resultatLabel.text = " BRAVO !\n VOUS AVEZ GAGNÉ ! "
            resultatLabel.textColor = UIColor.yellow
            
        } else {
            
            resultatLabel.text = " PERDU\n Essayez de nouveau ! "
            resultatLabel.textColor = UIColor.red
            
        }
    }
    
    // MARK - Variables
    var collectionFruits:[String] = [String]()
    var component0:[Int] = [Int]()
    var component1:[Int] = [Int]()
    var component2:[Int] = [Int]()
    
    // MARK - Fonction aléatoire
    func randomNumber(num:Int) -> Int {
        return Int(arc4random_uniform(UInt32(num)))
    }
    
    // MARK - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionFruits = ["🍓","🍒","🍑","🍎","🍍","🍌","🍊","🍉","🍈","🍇"]
        
        for _ in 0...100 {
            
            component0.append(randomNumber(num: collectionFruits.count - 1))
            component1.append(randomNumber(num: collectionFruits.count - 1))
            component2.append(randomNumber(num: collectionFruits.count - 1))
        }
        
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
        return 100
    }
    
    // MARK - Hauteur
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 120.00
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
            pickerLabel.text = collectionFruits[component0[row]]
        case 1:
            pickerLabel.text = collectionFruits[component1[row]]
        case 2:
            pickerLabel.text = collectionFruits[component2[row]]
        default:
            pickerLabel.text = ""
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }
    
    
    
}





















