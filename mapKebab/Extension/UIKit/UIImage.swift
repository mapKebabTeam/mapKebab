//
//  UIImage.swift
//  mapKebab
//
//  Created by Vanya Bogdantsev on 15.11.2022.
//

import UIKit

extension UIImage {
    
    static var map: UIImage {
        return UIImage(systemName: "map.fill") ?? UIImage()
    }
    
    static var favorites: UIImage {
        return UIImage(systemName: "heart.fill") ?? UIImage()
    }
    
    static var profile: UIImage {
        return UIImage(systemName: "person.circle.fill") ?? UIImage()
    }
    
    static var logo: UIImage {
        return UIImage(named: "logo") ?? UIImage()
    }
    
}


