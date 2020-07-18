//
//  GameCollectionView.swift
//  MyGames
//
//  Created by Ivan Costa on 16/07/20.
//

import UIKit

class GameCollectionView: UIView {


    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = true
        return collection
    }()

    init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemBackground

        configureCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("Error!")
    }
}

private extension GameCollectionView {

    func configureCollectionView() {
        addSubview(collectionView)
        collectionView.widthAnchor.constraint(equalTo: widthAnchor, constant: 1).isActive = true
        collectionView.heightAnchor.constraint(equalTo: heightAnchor,constant: 1).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }


}
