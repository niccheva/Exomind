//
//  PhotoInteractor.swift
//  Domain
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

public protocol PhotoInteractorInterface {
    func getPhotos(userId: Int, albumId: Int, handler: @escaping ([PhotoEntity]) -> ())
}

public class PhotoInteractor: PhotoInteractorInterface {
    let photoDomainRepo: PhotoDomainRepoInterface

    public init(photoDomainRepo: PhotoDomainRepoInterface) {
        self.photoDomainRepo = photoDomainRepo
    }

    public func getPhotos(userId: Int, albumId: Int, handler: @escaping ([PhotoEntity]) -> ()) {
        photoDomainRepo.getPhotos(userId: userId, albumId: albumId, handler: handler)
    }
}
