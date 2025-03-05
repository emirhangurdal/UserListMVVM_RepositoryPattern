//
//  UserDetailVC.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation
import UIKit

class UserProfileVC: UIViewController {
    
    private let user: User
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        let headerView = UserProfileHeaderView(user: user)
        contentView.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        let addressView = AddressView(address: user.address)
        contentView.addSubview(addressView)
        
        addressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            addressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        let companyView = CompanyView(company: user.company)
        contentView.addSubview(companyView)
        
        companyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            companyView.topAnchor.constraint(equalTo: addressView.bottomAnchor, constant: 24),
            companyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            companyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            companyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}


