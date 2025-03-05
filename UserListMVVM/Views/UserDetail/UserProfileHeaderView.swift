//
//  UserProfileHeaderView.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation
import UIKit

final class UserProfileHeaderView: UIView {
    
    private let user: User
    
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    
    init(user: User) {
        self.user = user
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        nameLabel.text = user.name
        usernameLabel.text = "@\(user.username)"
        emailLabel.text = user.email
        phoneLabel.text = "Phone: \(user.phone)"
        
        nameLabel.font = .boldSystemFont(ofSize: 24)
        usernameLabel.font = .systemFont(ofSize: 18)
        emailLabel.font = .systemFont(ofSize: 18)
        emailLabel.textColor = .gray
        nameLabel.textColor = .black
        usernameLabel.textColor = .darkGray
        phoneLabel.textColor = .darkGray
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, usernameLabel, emailLabel, phoneLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

