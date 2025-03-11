//
//  UserEntity+ToModel.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 7.03.2025.
//

import Foundation
import CoreData

extension UserEntity {
    func toModel() -> User {
        return User(
            id: Int(id),
            name: name ?? "",
            username: username ?? "",
            email: email ?? "",
            address: address?.toModel() ?? Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")),
            phone: phone ?? "",
            website: website ?? "",
            company: company?.toModel() ?? Company(name: "", catchPhrase: "", bs: "")
        )
    }
}

extension AddressEntity {
    func toModel() -> Address {
        return Address(
            street: street ?? "",
            suite: suite ?? "",
            city: city ?? "",
            zipcode: zipcode ?? "",
            geo: geo?.toModel() ?? Geo(lat: "", lng: "")
        )
    }
}

extension GeoEntity {
    func toModel() -> Geo {
        return Geo(
            lat: lat ?? "",
            lng: lng ?? ""
        )
    }
}

extension CompanyEntity {
    func toModel() -> Company {
        return Company(
            name: name ?? "",
            catchPhrase: catchPhrase ?? "",
            bs: bs ?? ""
        )
    }
}
