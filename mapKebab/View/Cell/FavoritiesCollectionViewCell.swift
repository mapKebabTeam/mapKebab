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
        let title = UILabel.boldTitle(text: "Name Kebab")
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let placeAdress: UILabel = {
        let adress = UILabel.graySecondary(text: "г. Ульяновск, ул. Гончарова, 31")
        adress.translatesAutoresizingMaskIntoConstraints = false
        return adress
    }()
    
    private let firstDayLabel: UILabel = {
        let label = UILabel.graySecondary(text: "пн - пт")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondDayLabel: UILabel = {
        let label = UILabel.graySecondary(text: "сб - вс")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstTimeLabel: UILabel = {
        let label = UILabel.blackSecondary(text: "10:00 - 20:00")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondTimeLabel: UILabel = {
        let label = UILabel.blackSecondary(text: "12:00 - 01:00")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    
    private let secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstaints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(placeImage)
        addSubview(placeTitle)
        addSubview(placeAdress)
        addSubview(firstStackView)
        addSubview(secondStackView)
        
        [firstDayLabel, firstTimeLabel].forEach { view in
            firstStackView.addArrangedSubview(view)
        }
        
        [secondDayLabel, secondTimeLabel].forEach { view in
            secondStackView.addArrangedSubview(view)
        }

        
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
            
            firstStackView.topAnchor.constraint(equalTo: placeAdress.bottomAnchor, constant: 10),
            firstStackView.leadingAnchor.constraint(equalTo: placeImage.trailingAnchor, constant: 14),
            
            secondStackView.topAnchor.constraint(equalTo: placeAdress.bottomAnchor, constant: 10),
            secondStackView.leadingAnchor.constraint(equalTo: firstStackView.trailingAnchor, constant: 14)
            
        ])
    }
    
}
    
//    // MARK: - constraints for StackView
//
//    private func setStackViewConstraint() {
//
////        let firstStackView = UIStackView(arrangedSubviews: [firstDayLabel, firstTimeLabel], axis: .vertical, spacing: 2, distribution: .equalCentering)
////
////        let secondStackView = UIStackView(arrangedSubviews: [secondDayLabel, secondTimeLabel], axis: .vertical, spacing: 2, distribution: .equalCentering)
//
//        self.addSubview(firstStackView)
//        NSLayoutConstraint.activate([
//            firstStackView.topAnchor.constraint(equalTo: placeAdress.bottomAnchor, constant: 10),
//            firstStackView.leadingAnchor.constraint(equalTo: placeImage.trailingAnchor, constant: 14)
//        ])
//
//        self.addSubview(secondStackView)
//        NSLayoutConstraint.activate([
//            secondStackView.topAnchor.constraint(equalTo: placeAdress.bottomAnchor, constant: 10),
//            secondStackView.leadingAnchor.constraint(equalTo: firstStackView.trailingAnchor, constant: 14)
//        ])
//    }
//
//}
