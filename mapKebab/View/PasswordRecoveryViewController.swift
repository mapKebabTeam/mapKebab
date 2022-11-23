//
//  PasswordRecoveryViewController.swift
//  mapKebab
//
//  Created by Максим on 16.11.2022.
//

import UIKit

class PasswordRecoveryViewController: UIViewController {
    
    // passwordRecovery label
    
    private let recoveryLabel = UILabel.mainTitle(text: "Password recovery", color: #colorLiteral(red: 0.2030155063, green: 0.2030155063, blue: 0.2030155063, alpha: 1))
    
    private let recoveryBaseLabel = UILabel.baseFont(text: "We will send you an email to reset your password", color: #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1))
    
    // passwordRecovery textField
    
    private let emailTextField = UITextField.setTextField(placeholder: "E-mail")
    
    
    // passwordRecovery stackView
    
    
    private let firstStackView = UIStackView.setStackView(axis: .vertical, spacing: 6, distribution: .equalCentering)
    
    private let secondStackView = UIStackView.setStackView(axis: .vertical, spacing: 32, distribution: .fillEqually)
    
    // passwordRecovery button
    
    private let reestablishButton: UIButton = {
        let button = UIButton.primaryButton(text: "Reestablish")
//        button.addTarget(self, action: #selector(_), for: .touchUpInside)
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
        
        view.addSubview(firstStackView)
        view.addSubview(secondStackView)

        
        emailTextField.delegate = self
        
        [recoveryLabel, recoveryBaseLabel].forEach { view in
            firstStackView.addArrangedSubview(view)
        }
        
        [emailTextField, reestablishButton].forEach { view in
            secondStackView.addArrangedSubview(view)
        }
    }
    
    private func setConstaints() {
        
        NSLayoutConstraint.activate([
            
            firstStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            firstStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 56),
            secondStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secondStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            secondStackView.heightAnchor.constraint(equalToConstant: 128),

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
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard()
    }
    
//    @objc func createAccountButtonTapped() {
//        let registrationViewController = RegistrationViewController()
//        registrationViewController.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(registrationViewController, animated: true)
//    }
}

// MARK: - UITextFieldDelegate

extension PasswordRecoveryViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.orange.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
    }
}

