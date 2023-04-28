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
    
    enum RMServiceError: Error{
        case failedToCherateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API Call /// Rick and Morty API Çağrısı Gönder
    ///  - Parameters:
    ///  - request: Request instance ///İstek örneği
    ///  - Type:  The type of object we expect to get back /// Geri almayı beklediğimiz nesne türü
    ///  - completion: Callback with data or error /// Veri veya hata ile geri arama
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCherateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            //Decone response //Yanıtı çöz
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    //    MARK: - Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
