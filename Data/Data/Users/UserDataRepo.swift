//
//  UserDataRepo.swift
//  Data
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

import Domain
import Alamofire

public class UserDataRepo: UserDomainRepoInterface {
    let remoteDataSource: UserRemoteDataSourceInterface
    let localDataSource: UserLocalDataSourceInterface

    public init(remoteDataSource: UserRemoteDataSourceInterface, localDataSource: UserLocalDataSourceInterface) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    public func getUsers(handler: @escaping ([UserEntity]) -> ()) {
        if NetworkReachabilityManager.default?.isReachable ?? false {
            remoteDataSource.getUsers {
                try? self.localDataSource.save(users: $0)
                handler($0.map { $0.entity })
            }
        } else {
            localDataSource.getUsers {
                handler($0.map { $0.entity })
            }
        }
    }
}
