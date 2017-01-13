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
    
    // MARK - Variables
    var collectionFruits:[String] = [String]()
    var component1:[Int] = [Int]()
    var component2:[Int] = [Int]()
    var component3:[Int] = [Int]()
    
    // MARK - Fonction aléatoire
    func randomNumber(num:Int) -> Int {
        return Int(arc4random_uniform(UInt32(num)))
    }
    
    // MARK - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionFruits = ["fraise","poire","kiwi","pomme","abricot","citron"]
        
        for i in 0...10 {
            
            component1.append(randomNumber(num: collectionFruits.count))
            component2.append(randomNumber(num: collectionFruits.count))
            component3.append(randomNumber(num: collectionFruits.count))
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
        return collectionFruits.count
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
            pickerLabel.text = collectionFruits[component1[row]]
        case 1:
            pickerLabel.text = collectionFruits[component2[row]]
        case 2:
            pickerLabel.text = collectionFruits[component3[row]]
        default:
            pickerLabel.text = ""
        }
        
        pickerLabel.font = UIFont(name: "Arial", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
    }
    
    
    
}





















