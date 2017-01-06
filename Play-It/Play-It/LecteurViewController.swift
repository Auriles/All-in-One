//
//  LecteurViewController.swift
//  Play-It
//
//  Created by Auriles El Haddad on 06/01/2017.
//  Copyright © 2017 Auriles El Haddad. All rights reserved.
//

import UIKit

class LecteurViewController: UIViewController {
    
    var chansonSelected: Chanson? = nil
    
    // Outlets
    @IBOutlet weak var dureeChansonSlider: UISlider!
    
    @IBOutlet weak var chansonImageView: UIImageView!
    
    @IBOutlet weak var volumeChansonSlider: UISlider!
    
    // Actions
    @IBAction func stopMusicAction(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func pauseMusicAction(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func jouerMusicAction(_ sender: UIBarButtonItem) {
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = (chansonSelected!.titre).capitalized
        chansonImageView.image = UIImage(named: "\(chansonSelected!.image).jpgs")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
