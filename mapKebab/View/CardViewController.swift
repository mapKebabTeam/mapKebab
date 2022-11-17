//
//  CardViewController.swift
//  mapKebab
//
//  Created by ILYA POPOV on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openSheet() {
        // Create the view controller.
        let sheetViewController = SheetViewController(nibName: nil, bundle: nil)
        
        // Present it w/o any adjustments so it uses the default sheet presentation.
        present(sheetViewController, animated: true, completion: nil)
    }
}
