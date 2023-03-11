//
//  TabBarViewController.swift
//  SpotifyClone
//
//  Created by Nick Semin on 11.03.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let libraryVC = LibraryViewController()
        
        homeVC.title = "Browse"
        searchVC.title = "Search"
        libraryVC.title = "Library"
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = . always
        libraryVC.navigationItem.largeTitleDisplayMode = .always
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.navigationBar.prefersLargeTitles = true
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        
        let searchNav = UINavigationController(rootViewController: searchVC)
        searchNav.navigationBar.prefersLargeTitles = true
        searchNav.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        
        let libraryNav = UINavigationController(rootViewController: libraryVC)
        libraryNav.navigationBar.prefersLargeTitles = true
        libraryNav.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 1)
        
        setViewControllers([homeNav, searchNav, libraryNav], animated: false)
    }
}
