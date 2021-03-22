//
//  PhotoDomainRepoInterface.swift
//  Domain
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

public protocol PhotoDomainRepoInterface {
    func getPhotos(userId: Int, albumId: Int, handler: @escaping ([PhotoEntity]) -> ())
}
