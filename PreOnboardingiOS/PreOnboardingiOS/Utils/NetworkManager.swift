//
//  NetworkManager.swift
//  PreOnboardingiOS
//
//  Created by 서보경 on 2023/02/20.
//

import Foundation

final class NetworkManager {
    
    // MARK: - Properties
    
    static let shared = NetworkManager()
    
    // MARK: - Init(s)
    
    private init() {}
    
    // MARK: - Request Function
    
    func request(urlString: String) -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
    
    
    // MARK: - Fetch Function
    
    func fetchData(
        request: URLRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard (response as? HTTPURLResponse)?.statusCode == 200, error == nil else {
                return completion(.failure(NetworkError.connectionFailed))
            }
            
            guard let data else {
                return completion(.failure(NetworkError.noData))
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
