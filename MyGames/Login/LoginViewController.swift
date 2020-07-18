//
//  LoginViewController.swift
//  MyGames
//
//  Created by Ivan Costa on 16/07/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func continueClick(_ sender: UIButton) {
        
        guard let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as GameTabBarViewController? else {
            return
        }
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        presentOnboarding()
    }
    
    func presentOnboarding() {
        let onboarding = OnboardingViewController()
        onboarding.nav = navigationController
        navigationController?.present(onboarding, animated: true)
    }

}
