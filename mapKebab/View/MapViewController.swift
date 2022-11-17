//
//  MapViewController.swift
//  mapKebab
//
//  Created by ILYA POPOV on 12.11.2022.
//

import UIKit
import MapboxMaps

class MapViewController: UIViewController {
    
    internal let mapView: MapView = {
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1IjoiMTN0aGFwb3N0bGUiLCJhIjoiY2xhZWx3OGpuMHY1NjNubWk5eWY2NjZpaiJ9.vNph4UQZpbgMaiEwMU4E5Q")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions)
        let map = MapView(frame: .zero, mapInitOptions: myMapInitOptions)
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    private var pointAnnotation : PointAnnotation = {
        var point = PointAnnotation(coordinate: CLLocationCoordinate2D(latitude: 54.3181, longitude: 48.3837))
        point.image = .init(image: UIImage.logo, name: "Kebab")
        point.iconAnchor = .bottom
        return point
    }()
    
    private var pointAnnotationManager : PointAnnotationManager!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        
        pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
        pointAnnotationManager.annotations = [pointAnnotation]
        
    }
    
    private func setupView() {
        view.addSubview(mapView)
    }

}

extension MapViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)

        ])
    }
    
}
