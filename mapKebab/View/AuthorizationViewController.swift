//
//  RegisterViewController.swift
//  mapKebab
//
//  Created by Максим on 15.11.2022.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    
    private let emailTextField = UITextField.setTextField(placeholder: "E-mail")
    private let passwordTextField : UITextField = {
        let tf = UITextField.setTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let authorizationStackView = UIStackView.setStackView(axis: .vertical, spacing: 16, distribution: .fillEqually)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)

        setupView()
        setConstaints()
        setupTextField()
        
        tabBarController?.tabBar.isHidden = true
        
    }
    
    private func setupView() {
        
        view.addSubview(authorizationStackView)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        [emailTextField, passwordTextField].forEach { view in
            authorizationStackView.addArrangedSubview(view)
        }

    }
    

    
    private func setupTextField() {
        
        let toolbar = UIToolbar()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: nil,
                                        action: nil)
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(dismissKeyboard))
                    
        toolbar.setItems([flexSpace, doneButton], animated: true)
        toolbar.sizeToFit()
                    
        emailTextField.inputAccessoryView = toolbar
        passwordTextField.inputAccessoryView = toolbar
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setConstaints() {
        
        NSLayoutConstraint.activate([
            
            authorizationStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            authorizationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorizationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authorizationStackView.heightAnchor.constraint(equalToConstant: 112),
            
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        dismissKeyboard()
        
        }
}


extension AuthorizationViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.orange.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
    }
    
}
