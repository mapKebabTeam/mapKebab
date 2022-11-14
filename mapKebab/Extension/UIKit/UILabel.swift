//
//  UILabel.swift
//  mapKebab
//
//  Created by Максим on 14.11.2022.
//

import UIKit

extension UILabel {
    
    static func boldTitle(text: String) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func graySecondary(text: String) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func blackSecondary(text: String) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
