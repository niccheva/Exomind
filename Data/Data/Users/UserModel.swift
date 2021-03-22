//
//  UserModel.swift
//  Data
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

import CoreData
import Domain

public struct UserModel: Codable {
    public let id: Int
    public let name: String
    public let username: String
    public let email: String
    public let phone: String
    public let website: String
    public let address: Address?
    public let company: Company?

    public var entity: UserEntity {
        UserEntity(
            id: id,
            name: name,
            username: username,
            email: email,
            phone: phone,
            website: website
        )
    }

    public struct Address: Codable {
        public let street: String
        public let suite: String
        public let city: String
        public let zipcode: String
        public let geo: Geo

        public struct Geo: Codable {
            public let lat: String
            public let lng: String
        }
    }

    public struct Company: Codable {
        public let name: String
        public let catchPhrase: String
        public let bs: String
    }
}

extension ManagedUser {
    var model: UserModel {
        UserModel(
            id: Int(id),
            name: name!,
            username: username!,
            email: email!,
            phone: phone!,
            website: website!,
            address: nil,
            company: nil
        )
    }

    convenience init(from user: UserModel) {
        self.init(context: CoreDataManager.shared.context)
        id = Int16(user.id)
        name = user.name
        username = user.username
        email = user.email
        phone = user.phone
        website = user.website
    }
}
