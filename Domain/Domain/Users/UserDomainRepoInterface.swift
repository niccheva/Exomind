//
//  UserDomainRepoInterface.swift
//  Domain
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

public protocol UserDomainRepoInterface {
    func getUsers(handler: @escaping ([UserEntity]) -> ())
}
