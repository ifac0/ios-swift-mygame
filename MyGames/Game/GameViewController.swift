//
//  GameViewController.swift
//  MyGames
//
//  Created by Ivan Costa on 28/05/20.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbConsole: UILabel!
    @IBOutlet weak var lbReleaseDate: UILabel!
    @IBOutlet weak var ivCover: UIImageView!
    
    var game: Game!
    
    @objc func editGame(){
        let create = AddEditViewController(nibName: "Game Editar", bundle: nil)
        
        create.game = self.game
        
        navigationController?.pushViewController(create, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        let edit = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editGame))
        navigationItem.rightBarButtonItem = edit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        lbTitle.text = game.title
        lbConsole.text = game.console?.name
        
        if let releaseDate = game.releaseDate {
            let formatter = DateFormatter()
            
            formatter.dateStyle = .long
            formatter.locale = Locale(identifier: "pt-BR")
            
            lbReleaseDate.text = "Lançamento: " + formatter.string(from: releaseDate)
        }
       
        if let image = game.cover as? UIImage {
            ivCover.image = image
        } else {
            ivCover.image = UIImage(named: "noCoverFull")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddEditViewController
        
        vc.game = game
    }

}
