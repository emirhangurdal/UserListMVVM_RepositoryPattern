//
//  UserListVC+TableView.swift.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation
import UIKit
// Extension of UserListVC for cleaner structure of code. This here implements delegate methods 
extension UserListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        let user = viewModel.users[indexPath.row]
        cell.configure(user: user)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let userDetailVC = UserProfileVC(user: viewModel.users[indexPath.row])
        self.navigationController?.pushViewController(userDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return }
            let user = self.viewModel.users[indexPath.row]
            let updatedUser = User(id: 1999, name: "Sarah", username: "Sarah", email: "sara@sarah", address: Address(street: "Street", suite: "Suite", city: "City", zipcode: "ZipCode", geo: Geo(lat: "0.0", lng: "0.0")), phone: "Phone", website: "website", company: Company(name: "Comp.", catchPhrase: "cp", bs: "bs"))
            self.viewModel.updateUser(user, updatedUser: updatedUser)
            completionHandler(true)
        }
        editAction.backgroundColor = .blue
        
        let configuration = UISwipeActionsConfiguration(actions: [editAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return }
            let userId = self.viewModel.users[indexPath.row].id
            self.viewModel.deleteUser(withId: userId)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .red
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}
