//
//  UITextField.swift
//  mapKebab
//
//  Created by ILYA POPOV on 15.11.2022.
//

import UIKit

extension UITextField {
    
    static func setTextField(placeholder : String) -> UITextField {
        
        let tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        tf.layer.cornerRadius = 10
        tf.layer.sublayerTransform = CATransform3DMakeTranslation(16, 0, 0)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = placeholder
        tf.layer.borderWidth = 2
        tf.layer.borderColor = UIColor.clear.cgColor
        return tf
    }
}
