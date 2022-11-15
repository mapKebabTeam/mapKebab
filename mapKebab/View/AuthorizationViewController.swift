//
//  RegisterViewController.swift
//  mapKebab
//
//  Created by Максим on 15.11.2022.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    private let authorizationLabel : UILabel = {
        let label = UILabel.mainTitle(text: "Authorization", color: #colorLiteral(red: 0.2030155063, green: 0.2030155063, blue: 0.2030155063, alpha: 1))
        label.textAlignment = .center
        return label
    }()
    private let baseLabel : UILabel = {
        let label = UILabel.baseFont(text: "To enter your profile, enter the data", color: #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1))
        label.textAlignment = .center
        return label
    }()
    
    private let authorizationButton : UIButton = {
        let button = UIButton.primaryButton(text: "Sign In")
        button.addTarget(self, action: #selector(authorizationButtonPush), for: .touchUpInside)
        return button
    }()
    
    private let emailTextField = UITextField.setTextField(placeholder: "E-mail")
    private let passwordTextField : UITextField = {
        let tf = UITextField.setTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let labelStackView = UIStackView.setStackView(axis: .vertical, spacing: 6, distribution: .equalCentering)
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
        view.addSubview(labelStackView)
        view.addSubview(authorizationButton)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        [emailTextField, passwordTextField].forEach { view in
            authorizationStackView.addArrangedSubview(view)
        }
        
        [authorizationLabel, baseLabel].forEach { view in
            labelStackView.addArrangedSubview(view)
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
            
            labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            labelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            authorizationStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 56),
            authorizationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorizationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authorizationStackView.heightAnchor.constraint(equalToConstant: 112),
            
            authorizationButton.topAnchor.constraint(equalTo: authorizationStackView.bottomAnchor, constant: 32),
            authorizationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorizationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authorizationButton.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
    
    @objc func authorizationButtonPush() {
        let registrationViewController = RegistrationViewController()
        navigationController?.pushViewController(registrationViewController, animated: true)
        registrationViewController.hidesBottomBarWhenPushed = true
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
