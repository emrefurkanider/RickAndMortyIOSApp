//
//  RMEndpoint.swift
//  03_RickAndMorty
//
//  Created by Emre Furkan İDER on 11.04.2023.
//

import Foundation

/// Represent unique API endpoint /// Benzersiz API uç noktasını temsil eder
@frozen enum RMEndpoint: String {
    
    /// Endpoint to get character info /// Karakter bilgisi almak için uç nokta
    case character
    
    /// Location to get character info /// Location bilgisi almak için uç nokta
    case location
    
    /// Episode to get character info /// Episode bilgisi almak için uç nokta
    case episode
}
