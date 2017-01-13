//
//  ViewController.swift
//  EggTimer
//
//  Created by Auriles El Haddad on 09/12/2016.
//  Copyright © 2016 Auriles El Haddad. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK - Variables
    var pickerInfo: [String] = []
    var tempsCuisson:Int = 0
    var timer:Timer = Timer()
    var estActif:Bool = false
    var lecteur:AVAudioPlayer = AVAudioPlayer()
    
    // MARK - Outlets
    @IBOutlet weak var minuteurLabel: UILabel!
    @IBOutlet weak var activerMinuteurBtn: UIButton!
    @IBOutlet weak var resetMinuteurBtn: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    // MARK - Actions
    @IBAction func ActiverMinuteurAction(_ sender: UIButton) {
        compteur()
    }
    @IBAction func resetMinuteurAction(_ sender: UIButton) {
        resetCompteur()
    }
    
    // MARK - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK - DataSource + Delegate
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerInfo = ["Oeufs Durs","Oeufs à la Coque","Oeuf Mollet","Oeuf Cocotte","Oeuf Poché","Omelette Baveuse","Test Professeur"]
        
        activerMinuteurBtn.setTitleColor(UIColor.green, for: UIControlState.normal)
        activerMinuteurBtn.isEnabled = false
        activerMinuteurBtn.alpha = 0.3
        
        alarm()
        
    }
    
    // MARK - Fonction sélection du temps de cuisson
    func selectionCuisson(selection : Int) {
        
        switch selection {
            
        case 0:
            tempsCuisson = 600
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 1:
            tempsCuisson = 180
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 2:
            tempsCuisson = 360
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 3:
            tempsCuisson = 180
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 4:
            tempsCuisson = 240
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 5:
            tempsCuisson = 300
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        case 6:
            tempsCuisson = 10
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            break
            
        default:
            print("Aucune séléction")
            break
            
        }
        
        // MARK - Sélection effectuée + réaffectation de l'opacité + réaffectation couleur
        activerMinuteurBtn.isEnabled = true
        activerMinuteurBtn.alpha = 1
        minuteurLabel.textColor = UIColor.black
    }
    
    // MARK - Fonction de conversion des heures en secondes
    func minuteurString(temps: Int) -> String {
        
        let heures = Int(temps) / 3600
        let minutes = Int(temps) / 60 % 60
        let secondes = Int(temps) % 60
        
        return String(format: "%02i:%02i:%02i", heures, minutes, secondes)
    }
    
    // MARK - Fonction Timer
    func compteur () {
        
        if (!estActif) {
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.incrementer), userInfo: nil, repeats: true)
            timer.fire()
            activerMinuteurBtn.setTitle("Stop", for: UIControlState.normal)
            activerMinuteurBtn.setTitleColor(UIColor.red, for: UIControlState.normal)
            estActif = true
            
        } else {
            
            timer.invalidate()
            activerMinuteurBtn.setTitle("Start", for: UIControlState.normal)
            activerMinuteurBtn.setTitleColor(UIColor.green, for: UIControlState.normal)
            estActif = false
            
        }
        
    }
    
    // MARK - Fonction d'incrémentation
    func incrementer () {
        
        if (tempsCuisson == 0) {
            
            timer.invalidate()
            
            minuteurLabel.text = "00:00:00"
            activerMinuteurBtn.setTitle("Start", for: UIControlState.normal)
            activerMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
            
            minuteurLabel.textColor = UIColor.green
            
            activerMinuteurBtn.isEnabled = false
            activerMinuteurBtn.alpha = 0.3
            
            lecteur.play()
            
        } else {
            
            tempsCuisson -= 1
            minuteurLabel.text = minuteurString(temps: tempsCuisson)
            
        }
    }
    
    // MARK - Reset le compteur à 0
    func resetCompteur () {
        
        timer.invalidate()
        
        tempsCuisson = 0
        minuteurLabel.text = "00:00:00"
        activerMinuteurBtn.setTitle("Start", for: UIControlState.normal)
        activerMinuteurBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        estActif = false
        
        activerMinuteurBtn.isEnabled = false
        activerMinuteurBtn.alpha = 0.3
        
        pickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    // MARK - AVAudioPlayer
    func alarm() {
        
        let fichier = Bundle.main.path(forResource: "alarm", ofType: "mp3")
        
        do {
            try lecteur = AVAudioPlayer(contentsOf: URL(string: fichier!)!)
        } catch {
            print("erreur lecture fichier mp3")
        }
    }
    
    // MARK - PickerViewDataSource
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerInfo.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerInfo[row]
        
    }
    
    // Mark - PickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectionCuisson(selection: row)
    }
}

