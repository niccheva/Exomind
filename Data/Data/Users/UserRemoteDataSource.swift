//
//  UserRemoteDataSource.swift
//  Data
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

import Moya

public protocol UserRemoteDataSourceInterface {
    init(provider: MoyaProvider<UserProvider>)

    func getUsers(handler: @escaping ([UserModel]) -> ())
}

public class UserRemoteDataSource: UserRemoteDataSourceInterface {
    internal let provider: MoyaProvider<UserProvider>

    public required init(provider: MoyaProvider<UserProvider>) {
        self.provider = provider
    }

    public func getUsers(handler: @escaping ([UserModel]) -> ()) {
        provider.request(.getUsers) { result in
            switch result {
            case .success(let response):
                guard let users = try? JSONDecoder().decode([UserModel].self, from: response.data) else { return handler([]) }
                handler(users)
            case .failure(let error):
                print("Error: \(error)")
                handler([])
            }
        }
    }
}
