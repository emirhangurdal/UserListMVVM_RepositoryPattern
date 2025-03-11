//
//  GeoEntity+CoreDataProperties.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 7.03.2025.
//
//

import Foundation
import CoreData


extension GeoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeoEntity> {
        return NSFetchRequest<GeoEntity>(entityName: "GeoEntity")
    }

    @NSManaged public var lat: String?
    @NSManaged public var lng: String?

}

extension GeoEntity : Identifiable {

}
