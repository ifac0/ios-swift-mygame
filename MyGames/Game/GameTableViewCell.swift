//
//  GameTableViewCell.swift
//  MyGames
//
//  Created by Ivan Costa on 28/05/20.
//

import UIKit
import CoreData

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbConsole: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepare(with game: Game) {
        lbTitle.text = game.title ?? "-"
        
        if lbTitle.text == "" {
            lbTitle.text = "-"
        }
        
        lbConsole.text = game.console?.name ?? "-"
        
        if let image = game.cover as? UIImage {
            ivCover.image = image
        } else {
            ivCover.image = UIImage(named: "noCover")
        }
    }
}
