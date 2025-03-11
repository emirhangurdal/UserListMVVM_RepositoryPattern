//
//  UserEntity+CoreDataProperties.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 7.03.2025.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var website: String?
    @NSManaged public var address: AddressEntity?
    @NSManaged public var company: CompanyEntity?

}

extension UserEntity : Identifiable {

}
