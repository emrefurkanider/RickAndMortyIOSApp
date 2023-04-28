//
//  RMGetAllCharactersResponse.swift
//  03_RickAndMorty
//
//  Created by Emre Furkan İDER on 18.04.2023.
//

import Foundation


struct RMGetAllCharactersResponse: Codable {
    
    struct info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    }
    
    let info: info
    let results: [RMCharacter]
}
