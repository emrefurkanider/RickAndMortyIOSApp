//
//  RMLocation.swift
//  03_RickAndMorty
//
//  Created by Emre Furkan İDER on 10.04.2023.
//

import Foundation

struct RMLocation: Codable{
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
