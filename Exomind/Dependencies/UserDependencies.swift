//
//  UserDependencies.swift
//  Exomind
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

import Moya
import Domain
import Presentation
import Data

class UserDependencies {
    func resolve() -> UserViewModel {
        let remoteDataSource = UserRemoteDataSource(provider: MoyaProvider<UserProvider>())
        let localDataSource = UserLocalDataSource()
        let repo = UserDataRepo(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
        let interactor = UserInteractor(userDomainRepo: repo)

        return UserViewModel(interactor: interactor)
    }
}
