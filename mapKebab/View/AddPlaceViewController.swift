//
//  AddPlaceViewController.swift
//  mapKebab
//
//  Created by Максим on 27.11.2022.
//

import UIKit

class AddPlaceViewController: UIViewController {
    
    // add place label
    
    private let addPlaceLabel = UILabel.mainTitle(text: "New establishment", color: #colorLiteral(red: 0.2030155063, green: 0.2030155063, blue: 0.2030155063, alpha: 1))
    
    private let addPlaceBaseLabel = UILabel.baseFont(text: "Add a new establishment to the map for users.", color: #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1))
    
    // add place textField
    
    private let namePlaceTextField = UITextField.setTextField(placeholder: "Institution name")
    
    private let adressPlaceTextField = UITextField.setTextField(placeholder: "Address")
    
    // add place stackView
    
    private let placeLabelStackView = UIStackView.setStackView(axis: .vertical, spacing: 6, distribution: .equalCentering)
    
    private let placeTextFieldStackView = UIStackView.setStackView(axis: .vertical, spacing: 16, distribution: .fillEqually)
    
    private let addPlaceButton: UIButton = {
        let button = UIButton.primaryButton(text: "Add an establishment")
        button.addTarget(self, action: #selector(addPlaceButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let addPlaceEmptyPhoto: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .none
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let addPlacePhotoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        button.setImage(UIImage(systemName: "photo", withConfiguration: UIImage.SymbolConfiguration(pointSize: CGFloat(40))), for: .normal)
        button.setTitle("Add photo", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1), for: .normal)
        button.tintColor = #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(addPlacePhotoButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true

        setupView()
        setConstraints()
        setupTextField()
        
    }
    
    private func setupView() {
        
        
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        
        view.addSubview(placeLabelStackView)
        view.addSubview(placeTextFieldStackView)
        view.addSubview(addPlaceButton)
        view.addSubview(addPlacePhotoButton)
        view.addSubview(addPlaceEmptyPhoto)
        
        [addPlaceLabel, addPlaceBaseLabel].forEach { view in
            placeLabelStackView.addArrangedSubview(view)
        }
        
        [namePlaceTextField, adressPlaceTextField,].forEach { view in
            placeTextFieldStackView.addArrangedSubview(view)
        }
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            placeLabelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            placeLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            placeLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            addPlacePhotoButton.topAnchor.constraint(equalTo: placeLabelStackView.bottomAnchor, constant: 32),
            addPlacePhotoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addPlacePhotoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addPlacePhotoButton.heightAnchor.constraint(equalToConstant: 206),
            
            placeTextFieldStackView.topAnchor.constraint(equalTo: addPlacePhotoButton.bottomAnchor, constant: 32),
            placeTextFieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            placeTextFieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            placeTextFieldStackView.heightAnchor.constraint(equalToConstant: 112),
            
            addPlaceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addPlaceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addPlaceButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addPlaceButton.heightAnchor.constraint(equalToConstant: 48),
            
            addPlaceEmptyPhoto.centerXAnchor.constraint(equalTo: addPlacePhotoButton.centerXAnchor),
            addPlaceEmptyPhoto.centerYAnchor.constraint(equalTo: addPlacePhotoButton.centerYAnchor),
            addPlaceEmptyPhoto.heightAnchor.constraint(equalToConstant: 206),
            addPlaceEmptyPhoto.widthAnchor.constraint(equalToConstant: 358)
        
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
                    
        namePlaceTextField.inputAccessoryView = toolbar
        adressPlaceTextField.inputAccessoryView = toolbar

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard()
    }
    
    @objc func addPlaceButtonTapped() {
        print("addPlaceButton tapped")
    }
    
    @objc func addPlacePhotoButtonTapped() {
        showImagePickerControllerActionSheet()
    }
}

extension AddPlaceViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.orange.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
    }
}

extension AddPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePickerControllerActionSheet() {
        let photoLibraryAction = UIAlertAction(title: "Choose from library", style: .default)
        { (action) in
            self.showImagePickerContoller(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Take from Camera", style: .default)
        { (action) in
            self.showImagePickerContoller(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        AlertService.showAlert(style: .actionSheet, title: "Choose your image", message: nil, actions: [photoLibraryAction, cameraAction, cancelAction])
    }
    
    func showImagePickerContoller(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editingImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            addPlaceEmptyPhoto.image = editingImage
            addPlacePhotoButton.layer.opacity = 1.0
            addPlaceEmptyPhoto.layer.cornerRadius = 10
            addPlaceEmptyPhoto.clipsToBounds = true
            addPlaceEmptyPhoto.contentMode = .scaleAspectFill
        } else if let originImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addPlaceEmptyPhoto.image = originImage
        }
        dismiss(animated: true)
    }
}