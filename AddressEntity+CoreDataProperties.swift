//
//  AddressEntity+CoreDataProperties.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 7.03.2025.
//
//

import Foundation
import CoreData


extension AddressEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AddressEntity> {
        return NSFetchRequest<AddressEntity>(entityName: "AddressEntity")
    }

    @NSManaged public var street: String?
    @NSManaged public var suite: String?
    @NSManaged public var city: String?
    @NSManaged public var zipcode: String?
    @NSManaged public var geo: GeoEntity?

}

extension AddressEntity : Identifiable {

}
