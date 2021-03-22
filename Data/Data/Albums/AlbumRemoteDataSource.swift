//
//  AlbumRemoteDataSource.swift
//  Data
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import Moya

public protocol AlbumRemoteDataSourceInterface {
    init(provider: MoyaProvider<AlbumProvider>)

    func getAlbums(userId: Int, handler: @escaping ([AlbumModel]) -> ())
}

public class AlbumRemoteDataSource: AlbumRemoteDataSourceInterface {
    internal let provider: MoyaProvider<AlbumProvider>

    public required init(provider: MoyaProvider<AlbumProvider>) {
        self.provider = provider
    }

    public func getAlbums(userId: Int, handler: @escaping ([AlbumModel]) -> ()) {
        provider.request(.getAlbums(userId: userId)) { result in
            switch result {
            case .success(let response):
                guard let albums = try? JSONDecoder().decode([AlbumModel].self, from: response.data) else { return handler([]) }
                handler(albums)
            case .failure(let error):
                print("Error: \(error)")
                handler([])
            }
        }
    }
}
