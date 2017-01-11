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
    
}

