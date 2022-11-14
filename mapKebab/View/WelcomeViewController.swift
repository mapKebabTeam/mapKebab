//
//  WelcomeViewController.swift
//  mapKebab
//
//  Created by ILYA POPOV on 14.11.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - create views for WelcomeViewController
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()

    private let nameApp: UILabel = {
        let label = UILabel()
        label.text = "mapKebab"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = #colorLiteral(red: 0.9921568627, green: 0.5764705882, blue: 0.2823529412, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    private let labelWelcome: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать!"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.2030155063, green: 0.2030155063, blue: 0.2030155063, alpha: 1)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        
    }
    
    private func setupView() {
        
        title = "Profile"
        
        view.addSubview(logoImage)
        view.addSubview(nameApp)
        
    }
}

extension WelcomeViewController {
    
    private func setConstraints() {
        
        let stackView = UIStackView(arrangedSubviews: [nameApp, labelWelcome], axis: .vertical, spacing: 2, distribution: .equalCentering)
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 230),
            logoImage.heightAnchor.constraint(equalToConstant: 230),
            
            stackView.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: 144),
            stackView.centerXAnchor.constraint(equalTo: logoImage.centerXAnchor)
        
        ])
    }    
}

