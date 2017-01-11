//
//  ViewController.swift
//  mooBox
//
//  Created by Auriles El Haddad on 11/01/2017.
//  Copyright © 2017 Auriles El Haddad. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mooBoxImageView: UIImageView!
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sonDeVache()
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake {
            player.play()
            rotationBoite()
        }
    }
    
    
    func sonDeVache() {
        
        let vache = Bundle.main.path(forResource: "cow", ofType: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(string: vache!)!)
        } catch {
            print("erreur lecture mp3")
        }
    }
    
    func rotationBoite() {
        
        var rotation:CGAffineTransform?
        
        rotation = CGAffineTransform(rotationAngle: -3)
        
        UIView.animate(withDuration: 1, animations: {
            self.mooBoxImageView.transform = rotation!
        }) {(true) in
            
            self.rotateBack()
            
        }
        
    }
    
    func rotateBack() {
        
        var rotation:CGAffineTransform?
        
        rotation = CGAffineTransform(rotationAngle: 0)
        
        UIView.animate(withDuration: 1, delay: 3.5, options: [], animations: {
            self.mooBoxImageView.transform = rotation!
        }, completion: nil)
        
        
    }
    
}

