//
//  GameCollectionViewCell.swift
//  MyGames
//
//  Created by Ivan Costa on 16/07/20.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbPlatform: UILabel!
    @IBOutlet weak var imCover: UIImageView!
    
    func prepare(with game: Game) {
        lbTitle.text = game.title ?? "-"
        
        if lbTitle.text == ""{
            lbTitle.text = "-"
        }
        
        lbPlatform.text = game.console?.name ?? "-"
        
        if let image = game.cover as? UIImage {
            imCover.image = image
        } else {
            imCover.image = UIImage(named: "noCover")
        }
    }
}
