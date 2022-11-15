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
        let mapViewController = createNavController(vc: MapViewController(), title: "Map", image: UIImage.map, tag: 0)
        let favoritesViewController = createNavController(vc: FavoritesViewController(), title: "Favorites", image: UIImage.favorites, tag: 1)
        let welcomeViewController = createNavController(vc: WelcomeViewController(), title: "Profile", image: UIImage.profile, tag: 2)
        
        viewControllers = [mapViewController, favoritesViewController, welcomeViewController]
    }
    
    private func createNavController(vc: UIViewController, title: String, image: UIImage, tag: Int) -> UINavigationController {
        let item = UITabBarItem(title: title, image: image, tag: tag)
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.9921568627, green: 0.5764705882, blue: 0.2823529412, alpha: 1)
        
        return navController
    }

}


