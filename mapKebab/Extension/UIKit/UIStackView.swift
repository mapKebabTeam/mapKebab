//
//  UIStackView.swift
//  mapKebab
//
//  Created by Максим on 14.11.2022.
//

import UIKit

extension UIStackView {
    
    static func setStackView(axis: NSLayoutConstraint.Axis,
                             spacing: CGFloat,
                             distribution: UIStackView.Distribution) -> UIStackView {
        
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}
