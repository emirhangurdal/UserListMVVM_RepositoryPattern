//
//  UserServiceProtocol.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 6.03.2025.
//

import Foundation
protocol UserServiceProtocol {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)

}
