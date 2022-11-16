//
//  RegistrationViewController.swift
//  mapKebab
//
//  Created by Максим on 16.11.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    // registration label
    
    private var registrationLabel = UILabel.mainTitle(text: "Registration", color: #colorLiteral(red: 0.2030155063, green: 0.2030155063, blue: 0.2030155063, alpha: 1))
    
    private var registrationBaseLabel = UILabel.baseFont(text: "Enter the data required for authorization", color: #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1))
    
    // registration textField
    
    private let emailTextField = UITextField.setTextField(placeholder: "E-mail")
    
    private let passwordTextField: UITextField = {
        let tf = UITextField.setTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let tf = UITextField.setTextField(placeholder: "Confirm the password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    // registration stackView
    
    private let registrationLabelStackView = UIStackView.setStackView(axis: .vertical, spacing: 6, distribution: .equalCentering)
    
    private let registrationTextFieldStackView = UIStackView.setStackView(axis: .vertical, spacing: 16, distribution: .fillEqually)
    
    // registration button
    
    private let registrationButton: UIButton = {
        let button = UIButton.primaryButton(text: "Create account")
        button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
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
        
        view.addSubview(registrationLabelStackView)
        view.addSubview(registrationTextFieldStackView)
        view.addSubview(registrationButton)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        [registrationLabel, registrationBaseLabel].forEach { view in
            registrationLabelStackView.addArrangedSubview(view)
        }
            
        [emailTextField, passwordTextField, confirmPasswordTextField].forEach { view in
            registrationTextFieldStackView.addArrangedSubview(view)
        }
    }
    
    private func setConstaints() {
        
        NSLayoutConstraint.activate([
            
            registrationLabelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            registrationLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            registrationLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            registrationTextFieldStackView.topAnchor.constraint(equalTo: registrationLabelStackView.bottomAnchor, constant: 56),
            registrationTextFieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            registrationTextFieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            registrationTextFieldStackView.heightAnchor.constraint(equalToConstant: 176),
            
            registrationButton.topAnchor.constraint(equalTo: registrationTextFieldStackView.bottomAnchor, constant: 32),
            registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            registrationButton.heightAnchor.constraint(equalToConstant: 48),
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
        confirmPasswordTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard()
    }
    
    @objc func registrationButtonTapped() {
//        let _ = _()
//        _.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(_, animated: true)
        print("tap")
    }
}

// MARK: - UITextFieldDelegate

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.orange.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
    }
}
    
