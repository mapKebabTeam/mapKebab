//
//  ProfileViewController.swift
//  mapKebab
//
//  Created by ILYA POPOV on 12.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //Button - Exit Profile
    let buttonExit : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "door.left.hand.open"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    func setupView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonExit)
        
    }
}
