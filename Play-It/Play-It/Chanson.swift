//
//  Chanson.swift
//  Play-It
//
//  Created by Auriles El Haddad on 06/01/2017.
//  Copyright © 2017 Auriles El Haddad. All rights reserved.
//

import UIKit

class Chanson: NSObject {
    
    // MARK - Variables
    var titre:String
    var artiste:String
    var image:String
    
    // MARK - Initialisation chanson
    init(titre:String, artiste:String, image:String) {
        
        self.titre = titre
        self.artiste = artiste
        self.image = image
    }
}
