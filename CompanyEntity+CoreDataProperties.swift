//
//  CompanyEntity+CoreDataProperties.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 7.03.2025.
//
//

import Foundation
import CoreData


extension CompanyEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompanyEntity> {
        return NSFetchRequest<CompanyEntity>(entityName: "CompanyEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var catchPhrase: String?
    @NSManaged public var bs: String?

}

extension CompanyEntity : Identifiable {

}
