//
//  AlbumDomainRepoInterface.swift
//  Domain
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

public protocol AlbumDomainRepoInterface {
    func getAlbums(userId: Int, handler: @escaping ([AlbumEntity]) -> ())
}
