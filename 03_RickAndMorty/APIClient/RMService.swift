//
//  RMService.swift
//  03_RickAndMorty
//
//  Created by Emre Furkan İDER on 11.04.2023.
//

import Foundation

/// Primary API service object to get Rick and Morty data /// Rick and Morty verilerini almak için birincil API hizmeti nesnesi
final class RMService{
    /// Shared singleton instance /// Paylaşılan tek örnek
    static let shared = RMService()
    
    /// Privatized constructor /// Özelleştirilmiş inşaatçı
    private init (){}
    
    /// Send Rick and Morty API Call /// Rick and Morty API Çağrısı Gönder
    ///  - Parameters:
    ///  - request: Request instance ///İstek örneği
    ///  - Type:  The type of object we expect to get back /// Geri almayı beklediğimiz nesne türü
    ///  - completion: Callback with data or error /// Veri veya hata ile geri arama
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>
        ) -> Void){
        
    }
}
