//
//  ViewController.swift
//  Play-It
//
//  Created by Auriles El Haddad on 06/01/2017.
//  Copyright © 2017 Auriles El Haddad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var musicCollectionView: UICollectionView!
    
    let array = ["badass","brazilsamba","funnysong","groovyhiphop","jazzcomedy","jazzyfrenchy","relaxing","romantic","theelevatorbossanova","thelounge"]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        musicCollectionView.dataSource = self
    }

    // MARK - CollectionViwDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "musicCell", for: indexPath) as! MusicCollectionViewCell
        
        let image = "\(array[indexPath.row]).jpg"
        
        cell.musicImageView.image = UIImage(named: image)
        return cell
    }


}

