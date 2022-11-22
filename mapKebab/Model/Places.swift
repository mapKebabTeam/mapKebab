//
//  Places.swift
//  mapKebab
//
//  Created by ILYA POPOV on 21.11.2022.
//

import Foundation
import FirebaseFirestore

struct Places {
    let name : String
    let adress : String
    let weekendWorkTime : String
    let workTime : String
}

//struct Places: Identifiable, Codable {
//    @DocumentID var id : String?
//    let name : String
//    let adress : String
//    let weekendWorkTime : String
//    let workTime : String
//}
