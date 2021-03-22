//
//  AlbumDependencies.swift
//  Exomind
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import Moya
import Domain
import Presentation
import Data

class AlbumDependencies {
    func resolve(userId: Int) -> AlbumViewModel {
        let remoteDataSource = AlbumRemoteDataSource(provider: MoyaProvider<AlbumProvider>())
        let localDataSource = AlbumLocalDataSource()
        let repo = AlbumDataRepo(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
        let interactor = AlbumInteractor(albumDomainRepo: repo)

        return AlbumViewModel(userId: userId, interactor: interactor)
    }
}
