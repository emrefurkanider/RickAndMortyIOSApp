//
//  RMRequest.swift
//  03_RickAndMorty
//
//  Created by Emre Furkan İDER on 11.04.2023.
//

import Foundation
/// Object that represents a single API call /// Tek bir API çağrısını temsil eden nesne
final class RMRequest {
    /// API Constants /// API Sabitleri
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint  /// İstenen endpoint
    private let endpoint: RMEndpoint
    
    ///Path components for API, if any /// Varsa, API için yol bileşenleri
    private let pathComponents: [String]
    
    ///Query arguments for API, if any ///Varsa, API için sorgu bağımsız değişkenleri
    private let queryParameters: [URLQueryItem]
    
    ///
    private var urlString: String{
        var String = Constants.baseUrl
        String += "/"
        String += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents .forEach({
                String += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty{
            String += "?"
            let argumentString = queryParameters.compactMap ({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            String += argumentString
        }
        return String
    }
    
    ///Computed & constructed API url ///Hesaplanan ve oluşturulmuş API url'si
    public var url: URL?{
        return URL(string: urlString)
    }
    
    ///Desired http method /// İstenen http yöntemi
    public let httpMethod = "GET"
    
    /// MARK: - Public
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint /// Hedef endpoint
    ///   - pathComponents: Collections of path components /// Yol bileşenleri koleksiyonları
    ///   - queryParameters: Collections of query parameters /// Sorgu parametresi koleksiyonları
    init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ){ 
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest{
    static let listCharacterRequests = RMRequest(endpoint: .character)
}
