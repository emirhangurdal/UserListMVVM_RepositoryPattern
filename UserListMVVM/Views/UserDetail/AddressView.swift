//
//  AddressView.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation
import UIKit

class AddressView: UIView {
    
    private let address: Address
    
    private let streetLabel = UILabel()
    private let suiteLabel = UILabel()
    private let cityLabel = UILabel()
    
    init(address: Address) {
        self.address = address
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        streetLabel.text = address.street
        suiteLabel.text = address.suite
        cityLabel.text = address.city
        streetLabel.textColor = .black
        suiteLabel.textColor = .black
        cityLabel.textColor = .black
        
        streetLabel.font = .systemFont(ofSize: 16)
        suiteLabel.font = .systemFont(ofSize: 16)
        cityLabel.font = .systemFont(ofSize: 16)
        
        let stackView = UIStackView(arrangedSubviews: [streetLabel, suiteLabel, cityLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
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
