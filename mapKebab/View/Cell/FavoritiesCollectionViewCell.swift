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
    
    private let placeTitle = UILabel.boldTitle(text: "")
    private let placeAdress = UILabel.graySecondary(text: "")
    private let firstDayLabel = UILabel.graySecondary(text: "")
    private let secondDayLabel = UILabel.graySecondary(text: "")
    private let firstTimeLabel = UILabel.blackSecondary(text: "")
    private let secondTimeLabel = UILabel.blackSecondary(text: "")
    
    private let firstStackView = UIStackView.setStackView(axis: .vertical, spacing: 2, distribution: .equalCentering)
    private let secondStackView = UIStackView.setStackView(axis: .vertical, spacing: 2, distribution: .equalCentering)
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstaints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(place : Places) {
        placeTitle.text = place.name
        placeAdress.text = place.adress
        firstTimeLabel.text = place.workTime
        secondTimeLabel.text = place.weekendWorkTime
    }
    
    
    
//    func configureCell(name: String, adress: String, workTime: String, weekendWorkTime: String) {
//        placeTitle.text = name
//        placeAdress.text = adress
//        firstTimeLabel.text = workTime
//        secondTimeLabel.text = weekendWorkTime
//    }
    
    
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
