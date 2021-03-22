//
//  UserInteractor.swift
//  Domain
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

public protocol UserInteractorInterface {
    func getUsers(handler: @escaping ([UserEntity]) -> ())
}

public class UserInteractor: UserInteractorInterface {
    let userDomainRepo: UserDomainRepoInterface

    public init(userDomainRepo: UserDomainRepoInterface) {
        self.userDomainRepo = userDomainRepo
    }

    public func getUsers(handler: @escaping ([UserEntity]) -> ()) {
        userDomainRepo.getUsers(handler: handler)
    }
}
