//
//  WelcomeViewController.swift
//  SpotifyClone
//
//  Created by Nick Semin on 11.03.2023.
//

import UIKit

class WelcomeViewController: UITabBarController {
    
    private let signInButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Spotify"
        view.backgroundColor = .systemGreen
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(
            x: 20,
            y: view.height - 50 - view.safeAreaInsets.bottom,
            width: view.width - 40,
            height: 50)
    }
    
    @objc func didTapSignIn() {
        let authVC = AuthViewController()
        authVC.completionHandler =  { [weak self] succes in
            DispatchQueue.main.async {
                self?.handleSignIn(success: succes)
            }
        }
        authVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(authVC, animated: true)
    }
    
    private func handleSignIn(success: Bool) {
        // Log user in or shopw an error
    }
}
