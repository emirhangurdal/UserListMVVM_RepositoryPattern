//
//  CompanyView.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation
import UIKit

class CompanyView: UIView {
    
    private let company: Company
    private let companyNameLabel = UILabel()
    
    init(company: Company) {
        self.company = company
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        companyNameLabel.text = "Company: \(company.name)"
        companyNameLabel.font = .systemFont(ofSize: 16)
        companyNameLabel.textColor = .darkGray
        
        addSubview(companyNameLabel)
        
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            companyNameLabel.topAnchor.constraint(equalTo: topAnchor),
            companyNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            companyNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            companyNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
