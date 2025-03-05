//
//  NetworkError.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation

// Network Errors
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
}
