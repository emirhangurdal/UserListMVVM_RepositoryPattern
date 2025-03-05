//
//  NetworkService.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation

class APIClient {
    //: Network Layer uses a function that takes generic type modern Result type for completion making it reusable for other endpoints if available. Using Network Errors enum, we can catch the errors and implement UI logic for example; error alerts. 
    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    func fetch<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(endpoint)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            //: Data Parsed with generic type making this function reusable for different types. 
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                completion(.failure(NetworkError.decodingError(error)))
            }
        }.resume()
    }
}


