//
//  FavoritiesTableViewCell.swift
//  mapKebab
//
//  Created by Максим on 13.11.2022.
//

import UIKit

class FavoritiesCollectionViewCell: UICollectionViewCell {
    
    private let placeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "place")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let placeTitle: UILabel = {
        let title = UILabel()
        title.text = "Name Kebab"
        title.textColor = #colorLiteral(red: 0.2030155063, green: 0.2030155063, blue: 0.2030155063, alpha: 1)
        title.font = UIFont.boldSystemFont(ofSize: 19)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        return title
    }()
    
    private let placeAdress: UILabel = {
        let adress = UILabel()
        adress.text = "г. Ульяновск, ул. Гончарова, 31"
        adress.textColor = #colorLiteral(red: 0.6274509804, green: 0.6274509804, blue: 0.6274509804, alpha: 1)
        adress.font = UIFont.systemFont(ofSize: 13)
        adress.translatesAutoresizingMaskIntoConstraints = false
        adress.textAlignment = .left
        return adress
    }()
    
    private let firstDayLabel: UILabel = {
        let label = UILabel()
        label.text = "пн - пт"
        label.textColor = #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondDayLabel: UILabel = {
        let label = UILabel()
        label.text = "сб - вс"
        label.textColor = #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "10:00 - 20:00"
        label.textColor = #colorLiteral(red: 0.1529411765, green: 0.1529411765, blue: 0.1529411765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "12:00 - 01:00"
        label.textColor = #colorLiteral(red: 0.1529411765, green: 0.1529411765, blue: 0.1529411765, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstaints()
        setStackViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(placeImage)
        addSubview(placeTitle)
        addSubview(placeAdress)
        
    }
}

extension FavoritiesCollectionViewCell {
    
    // MARK: - constraints for image, title and adress
    
    private func setConstaints() {
        
        NSLayoutConstraint.activate([
            
            placeImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            placeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            placeImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            placeImage.widthAnchor.constraint(equalToConstant: 130),
            
            placeTitle.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            placeTitle.leadingAnchor.constraint(equalTo: placeImage.trailingAnchor, constant: 14),
            placeTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            
            placeAdress.topAnchor.constraint(equalTo: placeTitle.bottomAnchor, constant: 3),
            placeAdress.leadingAnchor.constraint(equalTo: placeImage.trailingAnchor, constant: 14),
            placeAdress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            
            
        ])
    }
    
    // MARK: - constraints for StackView
    
    private func setStackViewConstraint() {
        
        let firstStackView = UIStackView(arrangedSubviews: [firstDayLabel, firstTimeLabel], axis: .vertical, spacing: 2, distribution: .equalCentering)
        
        let secondStackView = UIStackView(arrangedSubviews: [secondDayLabel, secondTimeLabel], axis: .vertical, spacing: 2, distribution: .equalCentering)
        
        self.addSubview(firstStackView)
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: placeAdress.bottomAnchor, constant: 10),
            firstStackView.leadingAnchor.constraint(equalTo: placeImage.trailingAnchor, constant: 14)
        ])
        
        self.addSubview(secondStackView)
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: placeAdress.bottomAnchor, constant: 10),
            secondStackView.leadingAnchor.constraint(equalTo: firstStackView.trailingAnchor, constant: 14)
        ])
    }
    
}
