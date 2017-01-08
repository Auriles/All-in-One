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
    
    var chansons = [Chanson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicCollectionView.dataSource = self
        
        for item in array {
            
            let chanson = Chanson(titre: item, artiste: "Par Bensound.com", image: "\(item).jpg")
            
            chansons.append(chanson)
        }
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
    }

    // MARK - CollectionViwDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chansons.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "musicCell", for: indexPath) as! MusicCollectionViewCell
        
        let chanson = chansons[indexPath.row]
        
        let image = "\(chanson.titre).jpg"
        
        cell.musicImageView.image = UIImage(named: image)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = self.musicCollectionView.indexPath(for: sender as! MusicCollectionViewCell) {
            
            if segue.identifier == "goToLecteur" {
                
                let chansonSelected = chansons[indexPath.row] as Chanson
                
                // Destination
                let lecteurVC = segue.destination as! LecteurViewController
                lecteurVC.chansonSelected = chansonSelected
            }
        }
    }


}

























