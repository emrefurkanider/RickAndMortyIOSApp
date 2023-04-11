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
    ///  - request: Request instance
    ///  - completion: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void){
        
    }
}
