//
//  UserLocalDataSource.swift
//  Data
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

import CoreData

public protocol UserLocalDataSourceInterface {
    func getUsers(handler: @escaping ([UserModel]) -> ())
    func save(users: [UserModel]) throws
}

public class UserLocalDataSource: UserLocalDataSourceInterface {
    public init() {}

    public func getUsers(handler: @escaping ([UserModel]) -> ()) {
        let context = CoreDataManager.shared.context
        let request: NSFetchRequest<ManagedUser> = ManagedUser.fetchRequest()

        if let users = try? context.fetch(request) {
            handler(users.map { $0.model })
        } else {
            handler([])
        }
    }

    public func save(users: [UserModel]) throws {
        _ = users.map(ManagedUser.init(from:))
        try CoreDataManager.shared.context.save()
    }
}
