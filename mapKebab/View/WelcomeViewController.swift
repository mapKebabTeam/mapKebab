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
    
    private let stackView = UIStackView.setStackView(axis: .vertical, spacing: 2, distribution: .equalCentering)
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Войдите, чтобы управлять своими избранными, делиться отзывами и другими полезными вещами"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = #colorLiteral(red: 0.6274509804, green: 0.6274509804, blue: 0.6274509804, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let joinButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.4980392157, blue: 0.2235294118, alpha: 1)
        button.setTitle("Войти или зарегистрироваться", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(joinButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
 
    }
    
    @objc private func joinButtonTapped() {
        print("tap")
    }
    
    private func setupView() {
        
        title = "Profile"
        
        view.addSubview(logoImage)
        view.addSubview(stackView)
        view.addSubview(subTitleLabel)
        view.addSubview(joinButton)
        
        [nameApp, labelWelcome].forEach { view in
            stackView.addArrangedSubview(view)
        }
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 230),
            logoImage.heightAnchor.constraint(equalToConstant: 230),
            
            stackView.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: 144),
            stackView.centerXAnchor.constraint(equalTo: logoImage.centerXAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 76),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            
            joinButton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 22),
            joinButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            joinButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            joinButton.heightAnchor.constraint(equalToConstant: 48)
        
        ])
    }
}

