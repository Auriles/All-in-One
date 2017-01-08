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
    
    var chansonSelected: Chanson? = nil
    var lecteur:AVAudioPlayer = AVAudioPlayer()
    
    // Outlets
    @IBOutlet weak var dureeChansonSlider: UISlider!
    
    @IBOutlet weak var chansonImageView: UIImageView!
    
    @IBOutlet weak var volumeChansonSlider: UISlider!
    
    @IBOutlet weak var debutLabel: UILabel!
    
    @IBOutlet weak var finLabel: UILabel!
    
    
    
    
    
    
    
    
    // Actions
    @IBAction func stopMusicAction(_ sender: UIBarButtonItem) {
        lecteur.stop()
    }
    
    @IBAction func pauseMusicAction(_ sender: UIBarButtonItem) {
        lecteur.pause()
    }
    
    @IBAction func jouerMusicAction(_ sender: UIBarButtonItem) {
        lecteur.play()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = (chansonSelected!.titre).capitalized
        chansonImageView.image = UIImage(named: "\(chansonSelected!.image).jpgs")
        
        volumeChansonSlider.addTarget(self, action: #selector(LecteurViewController.ajusterVolume(_sender:)), for: UIControlEvents.valueChanged)
        
        // Contrôler durée chanson
        dureeChansonSlider.addTarget(self, action: #selector(LecteurViewController.ajusterDuree(_sender:)), for: UIControlEvents.valueChanged)
        
        // Indiquer position chanson
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(LecteurViewController.mettreAJourDuree), userInfo: nil, repeats: true)
        
        // Afficher durée chanson
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(LecteurViewController.afficherDuree), userInfo: nil, repeats: true)
        
        jouerLecteurMp3()
        
    }
    
    func ajusterVolume(_sender:UISlider) {
        print("volume ajusté \(volumeChansonSlider.value)")
        lecteur.volume = volumeChansonSlider.value
    }
    
    func ajusterDuree(_sender:UISlider) {
        lecteur.currentTime = TimeInterval(dureeChansonSlider.value)
    }
    
    func mettreAJourDuree() {
        dureeChansonSlider.value = Float(lecteur.currentTime)
    }
    
    func afficherDuree() {
        print("durée actuelle: \(lecteur.duration - lecteur.currentTime)")
        
        debutLabel.text = "\(lecteur.currentTime)"
        finLabel.text = "\(lecteur.duration - lecteur.currentTime)"
    }

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
