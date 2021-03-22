//
//  AlbumInteractor.swift
//  Domain
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

public protocol AlbumInteractorInterface {
    func getAlbums(userId: Int, handler: @escaping ([AlbumEntity]) -> ())
}

public class AlbumInteractor: AlbumInteractorInterface {
    let albumDomainRepo: AlbumDomainRepoInterface

    public init(albumDomainRepo: AlbumDomainRepoInterface) {
        self.albumDomainRepo = albumDomainRepo
    }

    public func getAlbums(userId: Int, handler: @escaping ([AlbumEntity]) -> ()) {
        albumDomainRepo.getAlbums(userId: userId, handler: handler)
    }
}
