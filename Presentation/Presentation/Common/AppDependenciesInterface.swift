//
//  AppDependenciesInterface.swift
//  Presentation
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

public protocol AppDependenciesInterface {
    func resolveUserDependencies() -> UserViewModel
    func resolveAlbumDependencies(userId: Int) -> AlbumViewModel
    func resolvePhotoDependencies(userId: Int, albumId: Int) -> PhotoViewModel
}
