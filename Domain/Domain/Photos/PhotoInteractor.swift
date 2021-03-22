//
//  PhotoInteractor.swift
//  Domain
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

public protocol PhotoInteractorInterface {
    func getPhotos(albumId: Int, handler: @escaping ([PhotoEntity]) -> ())
}

public class PhotoInteractor: PhotoInteractorInterface {
    let photoDomainRepo: PhotoDomainRepoInterface

    public init(photoDomainRepo: PhotoDomainRepoInterface) {
        self.photoDomainRepo = photoDomainRepo
    }

    public func getPhotos(albumId: Int, handler: @escaping ([PhotoEntity]) -> ()) {
        photoDomainRepo.getPhotos(albumId: albumId, handler: handler)
    }
}
