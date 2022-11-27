//
//  ProfileViewController.swift
//  mapKebab
//
//  Created by Максим on 24.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var table = ["My reviews", "Settings"]
    
    // MARK: - Create views for ProfileViewCintroller
    
    private var namePerson = UILabel.mainTitle(text: "example@gmail.com", color: #colorLiteral(red: 0.2030155063, green: 0.2030155063, blue: 0.2030155063, alpha: 1))
    
    private let profileBackgroundImageView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 67
        view.clipsToBounds = true
        view.layer.borderWidth = 2
        view.backgroundColor = .none
        view.layer.borderColor = #colorLiteral(red: 0.9803921569, green: 0.4980392157, blue: 0.2235294118, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileEmptyPhoto: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .none
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let buttonAddPhoto: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: CGFloat(40))), for: .normal)
        button.tintColor = #colorLiteral(red: 0.9803921569, green: 0.4980392157, blue: 0.2235294118, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.9835832715, green: 0.8832899928, blue: 0.8271723986, alpha: 1)
        button.layer.cornerRadius = 60
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(profileImageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.rowHeight = UITableView.automaticDimension
        table.isScrollEnabled = false
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let addPlaceLabel: UILabel = {
        let label = UILabel.baseFont(text: "Make the app better! \n Share new establishments.", color: #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1))
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private let addPlaceButton: UIButton = {
        let button = UIButton.primaryButton(text: "Add new establishment")
        button.addTarget(self, action: #selector(addPlaceButtonTapped), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraints()
        
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setupView() {
        
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        title = "Profile"
        
        view.addSubview(profileBackgroundImageView)
        view.addSubview(namePerson)
        profileBackgroundImageView.addSubview(buttonAddPhoto)
        view.addSubview(profileEmptyPhoto)
        view.addSubview(tableView)
        view.addSubview(addPlaceLabel)
        view.addSubview(addPlaceButton)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @objc fileprivate func profileImageButtonTapped() {
        showImagePickerControllerActionSheet()
    }
    
    @objc func addPlaceButtonTapped() {
        let addPlaceViewController = AddPlaceViewController()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", image: nil, target: self, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.6887677908, green: 0.6887677312, blue: 0.6887677312, alpha: 1)
        addPlaceViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addPlaceViewController, animated: true)
    }
    
    // MARK
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            profileBackgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileBackgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileBackgroundImageView.heightAnchor.constraint(equalToConstant: 132),
            profileBackgroundImageView.widthAnchor.constraint(equalToConstant: 132),
            
            profileEmptyPhoto.centerXAnchor.constraint(equalTo: profileBackgroundImageView.centerXAnchor),
            profileEmptyPhoto.centerYAnchor.constraint(equalTo: profileBackgroundImageView.centerYAnchor),
            profileEmptyPhoto.heightAnchor.constraint(equalToConstant: 120),
            profileEmptyPhoto.widthAnchor.constraint(equalToConstant: 120),
            
            buttonAddPhoto.centerXAnchor.constraint(equalTo: profileBackgroundImageView.centerXAnchor),
            buttonAddPhoto.centerYAnchor.constraint(equalTo: profileBackgroundImageView.centerYAnchor),
            buttonAddPhoto.widthAnchor.constraint(equalToConstant: 120),
            buttonAddPhoto.heightAnchor.constraint(equalToConstant: 120),
            
            namePerson.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            namePerson.topAnchor.constraint(equalTo: profileBackgroundImageView.bottomAnchor, constant: 14),
            
            tableView.topAnchor.constraint(equalTo: namePerson.bottomAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addPlaceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            addPlaceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            addPlaceLabel.bottomAnchor.constraint(equalTo: addPlaceButton.topAnchor, constant: -12),
            
            addPlaceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addPlaceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addPlaceButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -66),
            addPlaceButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
    }
    
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var config = cell.defaultContentConfiguration()
        config.text = table[indexPath.row]
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator
        if indexPath.row == table.count-1 {
            cell.separatorInset.left = tableView.bounds.width
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        configure(cell: &cell, for: indexPath)
        return cell
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
            profileEmptyPhoto.image = editingImage
            buttonAddPhoto.layer.opacity = 1.0
            profileEmptyPhoto.layer.cornerRadius = 60
            profileEmptyPhoto.clipsToBounds = true
            profileEmptyPhoto.contentMode = .scaleAspectFill
        } else if let originImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileEmptyPhoto.image = originImage
        }
        dismiss(animated: true)
    }
}

