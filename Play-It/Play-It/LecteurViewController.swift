//
//  LecteurViewController.swift
//  Play-It
//
//  Created by Auriles El Haddad on 06/01/2017.
//  Copyright © 2017 Auriles El Haddad. All rights reserved.
//

import UIKit
import AVFoundation

class LecteurViewController: UIViewController {
    
    // MARK - Variables
    var chansonSelected: Chanson? = nil
    var lecteur:AVAudioPlayer = AVAudioPlayer()
    
    // MARK - Outlets
    @IBOutlet weak var dureeChansonSlider: UISlider!
    @IBOutlet weak var chansonImageView: UIImageView!
    @IBOutlet weak var volumeChansonSlider: UISlider!
    @IBOutlet weak var debutLabel: UILabel!
    @IBOutlet weak var finLabel: UILabel!
    
    // MARK - Actions
    @IBAction func stopMusicAction(_ sender: UIBarButtonItem) {
        lecteur.stop()
    }
    @IBAction func pauseMusicAction(_ sender: UIBarButtonItem) {
        lecteur.pause()
    }
    @IBAction func jouerMusicAction(_ sender: UIBarButtonItem) {
        lecteur.play()
    }
    
    // MARK - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = (chansonSelected!.titre).capitalized
        chansonImageView.image = UIImage(named: "\(chansonSelected!.image).jpgs")
        
        // MARK - Formatter 'Back' button
        let backBtn = UIBarButtonItem(title: "< Playlist", style: .plain, target: self, action: #selector(LecteurViewController.reset(_sender:)))
        
        self.navigationItem.leftBarButtonItem = backBtn
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        // MARK - Contrôler volume chanson
        volumeChansonSlider.addTarget(self, action: #selector(LecteurViewController.ajusterVolume(_sender:)), for: UIControlEvents.valueChanged)
        
        // MARK - Contrôler durée chanson
        dureeChansonSlider.addTarget(self, action: #selector(LecteurViewController.ajusterDuree(_sender:)), for: UIControlEvents.valueChanged)
        
        // MARK - Indiquer position chanson
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(LecteurViewController.mettreAJourDuree), userInfo: nil, repeats: true)
        
        // MARK - Afficher durée chanson
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(LecteurViewController.afficherDuree), userInfo: nil, repeats: true)
        
        jouerLecteurMp3()
        
    }
    
    // MARK - Fonction reset
    func reset(_sender:UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK - Fonction ajuster volume
    func ajusterVolume(_sender:UISlider) {
        print("volume ajusté \(volumeChansonSlider.value)")
        lecteur.volume = volumeChansonSlider.value
    }
    
    // MARK - Fonction ajuster durée chanson
    func ajusterDuree(_sender:UISlider) {
        lecteur.currentTime = TimeInterval(dureeChansonSlider.value)
    }
    
    // MARK - Fonction mettre à jour durée
    func mettreAJourDuree() {
        dureeChansonSlider.value = Float(lecteur.currentTime)
    }
    
    // MARK - Fonction afficher durée
    func afficherDuree() {
        print("durée actuelle: \(lecteur.duration - lecteur.currentTime)")
        
        debutLabel.text = retournerPositionActuelle()
        finLabel.text = retournerDureeTotale()
    }
    
    // MARK - Fonction retourner position actuelle
    func retournerPositionActuelle() -> String {
        
        var seconds = 0
        var minutes = 0
        
        if let duree = lecteur.currentTime as? TimeInterval {
            
            seconds = Int(duree) % 60
            minutes = (Int(duree) / 60) % 60
            
        }
        
        return String(format: "%0.2i:%0.2i", minutes, seconds)
    }
    
    // MARK - Fonction retourner durée totale
    func retournerDureeTotale() -> String {
        
        var seconds = 0
        var minutes = 0
        
        if let duree = lecteur.currentTime as? TimeInterval {
            
            var dureeTotale:TimeInterval?
            dureeTotale = lecteur.duration - lecteur.currentTime
            
            seconds = Int(dureeTotale!) % 60
            minutes = (Int(dureeTotale!) / 60) % 60
            
        }
        
        return String(format: "%0.2i:%0.2i", minutes, seconds)
        
    }
    
    // MARK - Fonction jouer lecteur
    func jouerLecteurMp3() {
        
        let chanson = "bensound-\(chansonSelected!.titre)"
        let fichierMp3 = Bundle.main.path(forResource: chanson, ofType: "mp3")
        
        do {
            
            try lecteur = AVAudioPlayer(contentsOf: URL(string: fichierMp3!)!)
            dureeChansonSlider.maximumValue = Float(lecteur.duration)
            
        } catch {
            print("erreur lecture mp3")
        }
        
        print("chanson jouée \(chanson)")
    }
}
