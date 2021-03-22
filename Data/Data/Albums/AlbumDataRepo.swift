//
//  AlbumDataRepo.swift
//  Data
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import Domain
import Alamofire

public class AlbumDataRepo: AlbumDomainRepoInterface {
    let remoteDataSource: AlbumRemoteDataSourceInterface
    let localDataSource: AlbumLocalDataSourceInterface

    public init(remoteDataSource: AlbumRemoteDataSourceInterface, localDataSource: AlbumLocalDataSourceInterface) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    public func getAlbums(userId: Int, handler: @escaping ([AlbumEntity]) -> ()) {
        if NetworkReachabilityManager.default?.isReachable ?? false {
            remoteDataSource.getAlbums(userId: userId) {
                try? self.localDataSource.save(albums: $0)
                handler($0.map { $0.entity })
            }
        } else {
            localDataSource.getAlbums(userId: userId) {
                handler($0.map { $0.entity })
            }
        }
    }
}
