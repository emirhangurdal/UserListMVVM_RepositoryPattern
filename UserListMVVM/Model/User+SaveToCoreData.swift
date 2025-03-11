//
//  User+SaveToCoreData.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 7.03.2025.
//

import Foundation
import CoreData

extension User {
    
    // Save a single User to Core Data
    func saveToCoreData(context: NSManagedObjectContext) {
        // Create a new UserEntity in Core Data
        let userEntity = UserEntity(context: context)
        
        // Map the User model properties to the Core Data UserEntity properties
        userEntity.id = Int64(self.id)
        userEntity.name = self.name
        userEntity.username = self.username
        userEntity.email = self.email
        userEntity.phone = self.phone
        userEntity.website = self.website
        
        // Address properties (ensure you handle address correctly as needed)
        userEntity.address?.street = self.address.street
        userEntity.address?.suite = self.address.suite
        userEntity.address?.city = self.address.city
        userEntity.address?.zipcode = self.address.zipcode
        
        // Company properties (similar handling for company)
        userEntity.company?.name = self.company.name
        userEntity.company?.catchPhrase = self.company.catchPhrase
        userEntity.company?.bs = self.company.bs
        
        // Save context after adding the user entity
        do {
            try context.save()
        } catch {
            print("Error saving user: \(error.localizedDescription)")
        }
    }
    
}

