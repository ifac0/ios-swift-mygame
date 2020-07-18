//
//  OnboardingViewController.swift
//  MyGames
//
//  Created by Ivan Costa on 16/07/20.
//

import UIKit

class OnboardingViewController: UIViewController {
    var nav:UINavigationController?
    private var onboardingView: OnboardingView = OnboardingView()
        private var dataSource: [OnboardingCollectionViewCellModel] = [
            OnboardingCollectionViewCellModel(mainText: "Salvar", imageName: "onboarding1"),
            OnboardingCollectionViewCellModel(mainText: "Edit", imageName: "onboarding2")
        ]
    
        private var didConfigure: Bool = false

        override func loadView() {
            onboardingView.nav = self.nav
            view = onboardingView
            configurePageControl()
            lockOrientation(.portrait, andRotateTo: .portrait)
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            lockOrientation(.allButUpsideDown)
        }

        func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }

        func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {

            self.lockOrientation(orientation)

            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        }

        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            if !didConfigure {
                didConfigure = true
                configureCollectionView()
            }
        }

        private func configurePageControl() {
            onboardingView.pageControl.numberOfPages = dataSource.count
        }

        private func configureCollectionView() {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = onboardingView.collectionView.frame.size
            layout.scrollDirection = .horizontal

            onboardingView.collectionView.delegate = self
            onboardingView.collectionView.dataSource = self
            onboardingView.collectionView.isPagingEnabled = true
            onboardingView.collectionView.collectionViewLayout = layout
            onboardingView.collectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCellID")
        }
    }

    extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return dataSource.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCellID", for: indexPath) as? OnboardingCollectionViewCell else {
                return UICollectionViewCell()
            }

            cell.configure(model: dataSource[indexPath.row])
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            onboardingView.pageControl.currentPage = indexPath.row
        }
}
