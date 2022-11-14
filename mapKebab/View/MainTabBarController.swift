//
//  ViewController.swift
//  appKebab
//
//  Created by Максим on 12.11.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupTabBar()
        
    }
    
    private func setupTabBar() {
        let mapViewController = createNavController(vc: MapViewController(), title: "Map", image: "map.fill", tag: 0)
        let favoritesViewController = createNavController(vc: FavoritesViewController(), title: "Favorites", image: "heart.fill", tag: 1)
        let welcomeViewController = createNavController(vc: WelcomeViewController(), title: "Profile", image: "person.circle.fill", tag: 2)
        
        viewControllers = [mapViewController, favoritesViewController, welcomeViewController]
    }
    
    private func createNavController(vc: UIViewController, title: String, image: String, tag: Int) -> UINavigationController {
        let item = UITabBarItem(title: title, image: UIImage(systemName: image), tag: tag)
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        tabBar.backgroundColor = .white
        
        return navController
    }

}

