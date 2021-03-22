//
//  AppDependencies.swift
//  Exomind
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

import Presentation

class AppDependencies: AppDependenciesInterface {
    func resolveUserDependencies() -> UserViewModel {
        UserDependencies().resolve()
    }

    func resolveAlbumDependencies(userId: Int) -> AlbumViewModel {
        AlbumDependencies().resolve(userId: userId)
    }

    func resolvePhotoDependencies(userId: Int, albumId: Int) -> PhotoViewModel {
        PhotoDependencies().resolve(userId: userId, albumId: albumId)
    }
}
