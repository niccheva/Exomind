//
//  UserEntity.swift
//  Domain
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

public struct UserEntity: Identifiable {
    public let id: Int
    public let name: String
    public let username: String
    public let email: String
    public let phone: String
    public let website: String

    public init(
        id: Int,
        name: String,
        username: String,
        email: String,
        phone: String,
        website: String
    ) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.phone = phone
        self.website = website
    }
}
