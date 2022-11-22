//
//  FavoritesViewController.swift
//  mapKebab
//
//  Created by ILYA POPOV on 12.11.2022.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var places : [Places] = []
    
    private let favoritesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = #colorLiteral(red: 0.9813271165, green: 0.9813271165, blue: 0.9813271165, alpha: 1)
        return collectionView
    }()
    
    private let idFavoritiesCell = "idFavoritiesCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraints()
        
    }
    
    func getAllTasks() {
            taskService.completeList(completion: { (status, tasks) in
                print(status)
            })
        }
    
    private func setupView() {
        
        favoritesCollectionView.delegate = self
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.register(FavoritiesCollectionViewCell.self,
                                         forCellWithReuseIdentifier: idFavoritiesCell)
        
        title = "Favorities"
        view.addSubview(favoritesCollectionView)
    }

}

extension FavoritesViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            favoritesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            favoritesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            favoritesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            favoritesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

// - MARK: UITableViewDelegate

extension FavoritesViewController: UICollectionViewDelegate {

    
}

// - MARK: UITableViewDataSource

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width/1
        
        return CGSize(width: width, height: 132)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idFavoritiesCell, for: indexPath) as! FavoritiesCollectionViewCell
        let place = places[indexPath.row]
        //cell.set(place: place)
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sheetViewController = SheetViewController(nibName: nil, bundle: nil)
        present(sheetViewController, animated: true, completion: nil)
    }
    
}


