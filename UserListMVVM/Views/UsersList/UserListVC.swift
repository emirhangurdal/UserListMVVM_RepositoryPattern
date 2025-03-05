//
//  UserList.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation
import UIKit

final class UserListVC: UIViewController {
    
    let viewModel: UserViewModel
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        return tv
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        viewModel.fetchUsers()
        setupTableView()
    }
    
    private func setupTableView() {
        self.overrideUserInterfaceStyle = .light
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    private func setupBindings() {
        viewModel.onUsersUpdated = { [weak self] in
            guard let self = self else {
                return}
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        viewModel.onError = { [weak self] in
            DispatchQueue.main.async {
                print("Error: \(self?.viewModel.errorMessage ?? "Unknown error")")
            }
        }
    }
    
}



