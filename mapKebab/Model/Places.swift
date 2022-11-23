//
//  Places.swift
//  mapKebab
//
//  Created by ILYA POPOV on 21.11.2022.
//

import Foundation

struct Places: Codable {
    let Mangal_House: Place
    let Shaurma_Club: Place
    let Shauroom: Place
}

struct Place: Codable {
    let name: String
    let adress: String
}


func callAPI() {
    guard let url = URL(string: "https://mapkebab-50224-default-rtdb.firebaseio.com/.json") else { return }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let response = response else { return }
//        print(response)
    }
    task.resume()
}

func decodeAPI() {
    guard let url = URL(string: "https://mapkebab-50224-default-rtdb.firebaseio.com/places.json") else { return }
    
    let task = URLSession.shared.dataTask(with: url){ data, response, error in
        let decoder = JSONDecoder()
        if let data = data{
            do {
                let tasks = try decoder.decode(Places.self, from: data)
                print(tasks)
            } catch let error as NSError {
                print("Error serializing JSON Data: \(error)")
            }
        }
    }
    task.resume()
}
