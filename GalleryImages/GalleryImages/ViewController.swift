//
//  ViewController.swift
//  GalleryImages
//
//  Created by Auriles El Haddad on 04/12/2016.
//  Copyright © 2016 Auriles El Haddad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var images:[String] = ["lion.png","canyon.png","concert.png","sommet.png","voiture.png"]
    
    var index = 1
    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func changerImageAction(_ sender: UIButton) {
        
        
        if (index == images.count - 1) {
            index = 0
        } else {
            index = index + 1
        }
        let imageStr:String = images[index]
            
        image.image = UIImage(named: imageStr)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

