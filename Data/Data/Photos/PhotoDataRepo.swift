//
//  PhotoDataRepo.swift
//  Data
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import Domain
import Alamofire

public class PhotoDataRepo: PhotoDomainRepoInterface {
    let remoteDataSource: PhotoRemoteDataSourceInterface
    let localDataSource: PhotoLocalDataSourceInterface

    public init(remoteDataSource: PhotoRemoteDataSourceInterface, localDataSource: PhotoLocalDataSourceInterface) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    public func getPhotos(userId: Int, albumId: Int, handler: @escaping ([PhotoEntity]) -> ()) {
        if NetworkReachabilityManager.default?.isReachable ?? false {
            remoteDataSource.getPhotos(userId: userId, albumId: albumId) {
                try? self.localDataSource.save(photos: $0)
                handler($0.map { $0.entity })
            }
        } else {
            localDataSource.getPhotos(albumId: albumId) {
                handler($0.map { $0.entity })
            }
        }
    }
}
