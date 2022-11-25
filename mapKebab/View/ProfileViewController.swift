//
//  ProfileViewController.swift
//  mapKebab
//
//  Created by Максим on 24.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileBackgroundImageView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 67
        view.clipsToBounds = true
        view.layer.borderWidth = 2
        view.backgroundColor = .none
        view.layer.borderColor = #colorLiteral(red: 0.9803921569, green: 0.4980392157, blue: 0.2235294118, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileEmptyPhoto: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.9803921569, green: 0.4980392157, blue: 0.2235294118, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.9835832715, green: 0.8832899928, blue: 0.8271723986, alpha: 1)
        button.layer.cornerRadius = 60
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraints()
        

    }
    
    private func setupView() {
        
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        title = "Profile"
        
        view.addSubview(profileBackgroundImageView)
        profileBackgroundImageView.addSubview(profileEmptyPhoto)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            profileBackgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 77),
            profileBackgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileBackgroundImageView.heightAnchor.constraint(equalToConstant: 132),
            profileBackgroundImageView.widthAnchor.constraint(equalToConstant: 132),
            
            profileEmptyPhoto.centerXAnchor.constraint(equalTo: profileBackgroundImageView.centerXAnchor),
            profileEmptyPhoto.centerYAnchor.constraint(equalTo: profileBackgroundImageView.centerYAnchor),
            profileEmptyPhoto.heightAnchor.constraint(equalToConstant: 120),
            profileEmptyPhoto.widthAnchor.constraint(equalToConstant: 120)
        
        ])
        
    }
    
    
    
}
