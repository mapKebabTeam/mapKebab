//
//  APIManager.swift
//  mapKebab
//
//  Created by ILYA POPOV on 21.11.2022.
//

import UIKit
import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseFirestore

class APIManager {
    
    let db = Firestore.firestore()
    
    static let shared = APIManager()
    
    func getDocument() {
        db.collection("places").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    
    func completeList(completion: @escaping (Bool, [Places]) -> ()){
        var tasks = [Places]()
        db.collection("places").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(false, tasks)
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
                completion(true, tasks)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    func getImage(picName: String, completion: @escaping (UIImage) -> Void) {
           let storage = Storage.storage()
           let reference = storage.reference()
           let pathRef = reference.child("placesPic")
           
           var image: UIImage = UIImage(named: "imageDef")!
           
           let fileRef = pathRef.child(picName)
           
           fileRef.getData(maxSize: 1920*1080) { data, error in
               guard error == nil else { completion(image); return }
               image = UIImage(data: data!)!
               completion(image)
           }
       }
    
    }
    

