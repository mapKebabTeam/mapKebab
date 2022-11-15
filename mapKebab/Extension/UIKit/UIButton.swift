//
//  UIButton.swift
//  mapKebab
//
//  Created by ILYA POPOV on 16.11.2022.
//

import UIKit

extension UIButton {
    
    static func primaryButton(text: String) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.4980392157, blue: 0.2235294118, alpha: 1)
        button.setTitle(text, for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
