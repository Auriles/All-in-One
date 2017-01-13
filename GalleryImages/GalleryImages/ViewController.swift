//
//  ViewController.swift
//  GalleryImages
//
//  Created by Auriles El Haddad on 04/12/2016.
//  Copyright © 2016 Auriles El Haddad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK - Variables
    var images:[String] = ["lion.png","canyon.png","concert.png","sommet.png","voiture.png"]
    var index = 1
    
    // MARK - Outlets
    @IBOutlet weak var image: UIImageView!
    
    // MARK - Actions
    @IBAction func changerImageAction(_ sender: UIButton) {
        
        if (index == images.count - 1) {
            index = 0
        } else {
            index = index + 1
        }
        let imageStr:String = images[index]
        
        image.image = UIImage(named: imageStr)
    }
    
    // MARK - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

