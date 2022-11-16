//
//  RegisterViewController.swift
//  mapKebab
//
//  Created by Максим on 15.11.2022.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    // authorization label
    
    private let authorizationLabel = UILabel.mainTitle(text: "Authorization", color: #colorLiteral(red: 0.2030155063, green: 0.2030155063, blue: 0.2030155063, alpha: 1))
    
    private let authorizationbaseLabel = UILabel.baseFont(text: "To enter your profile, enter the data", color: #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1))
    
    // authorization textField
    
    private let emailTextField = UITextField.setTextField(placeholder: "E-mail")
    
    private let passwordTextField: UITextField = {
        let tf = UITextField.setTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    // authorization stackView
    
    private let authorizationLabelStackView = UIStackView.setStackView(axis: .vertical, spacing: 6, distribution: .equalCentering)
    
    private let authorizationTextFieldStackView = UIStackView.setStackView(axis: .vertical, spacing: 16, distribution: .fillEqually)
    
    // authorization button
    
    private let authorizationButton: UIButton = {
        let button = UIButton.primaryButton(text: "Sign In")
//        button.addTarget(self, action: #selector(_), for: .touchUpInside)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton.primaryButton(text: "Create account")
        button.layer.borderWidth = 1.5
        button.layer.borderColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        button.backgroundColor = .none
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
       let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.titleLabel?.textColor = .black
        button.setTitleColor(UIColor(red: 0.629, green: 0.629, blue: 0.629, alpha: 1), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)

        setupView()
        setConstaints()
        setupTextField()
        
        tabBarController?.tabBar.isHidden = true
    }
    
    // funcs
    
    private func setupView() {
        
        view.addSubview(authorizationTextFieldStackView)
        view.addSubview(authorizationLabelStackView)
        view.addSubview(authorizationButton)
        view.addSubview(createAccountButton)
        view.addSubview(forgotPasswordButton)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        [emailTextField, passwordTextField].forEach { view in
            authorizationTextFieldStackView.addArrangedSubview(view)
        }
        
        [authorizationLabel, authorizationbaseLabel].forEach { view in
            authorizationLabelStackView.addArrangedSubview(view)
        }
    }
    
    private func setConstaints() {
        
        NSLayoutConstraint.activate([
            
            authorizationLabelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            authorizationLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authorizationLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorizationLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            authorizationTextFieldStackView.topAnchor.constraint(equalTo: authorizationLabelStackView.bottomAnchor, constant: 56),
            authorizationTextFieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorizationTextFieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authorizationTextFieldStackView.heightAnchor.constraint(equalToConstant: 112),
            
            authorizationButton.topAnchor.constraint(equalTo: authorizationTextFieldStackView.bottomAnchor, constant: 32),
            authorizationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorizationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authorizationButton.heightAnchor.constraint(equalToConstant: 48),
            
            createAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            createAccountButton.heightAnchor.constraint(equalToConstant: 48),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: authorizationButton.bottomAnchor, constant: 16),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 18)
        ])
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard()
    }
    
    @objc func forgotPasswordButtonTapped() {
        let passwordRecoveryViewController = PasswordRecoveryViewController()
        passwordRecoveryViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(passwordRecoveryViewController, animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", image: nil, target: self, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1)
    }
    
    @objc func createAccountButtonTapped() {
        let registrationViewController = RegistrationViewController()
        registrationViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(registrationViewController, animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", image: nil, target: self, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1)
    }
}

// MARK: - UITextFieldDelegate

extension AuthorizationViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.orange.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
    }
}
