//
//  PhotoDependencies.swift
//  Exomind
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import Moya
import Domain
import Presentation
import Data

class PhotoDependencies {
    func resolve(userId: Int, albumId: Int) -> PhotoViewModel {
        let remoteDataSource = PhotoRemoteDataSource(provider: MoyaProvider<PhotoProvider>())
        let localDataSource = PhotoLocalDataSource()
        let repo = PhotoDataRepo(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
        let interactor = PhotoInteractor(photoDomainRepo: repo)

        return PhotoViewModel(userId: userId, albumId: albumId, interactor: interactor)
    }
}
