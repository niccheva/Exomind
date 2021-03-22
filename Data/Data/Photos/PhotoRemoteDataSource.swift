//
//  PhotoRemoteDataSource.swift
//  Data
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import Moya

public protocol PhotoRemoteDataSourceInterface {
    init(provider: MoyaProvider<PhotoProvider>)

    func getPhotos(userId: Int, albumId: Int, handler: @escaping ([PhotoModel]) -> ())
}

public class PhotoRemoteDataSource: PhotoRemoteDataSourceInterface {
    internal let provider: MoyaProvider<PhotoProvider>

    public required init(provider: MoyaProvider<PhotoProvider>) {
        self.provider = provider
    }

    public func getPhotos(userId: Int, albumId: Int, handler: @escaping ([PhotoModel]) -> ()) {
        provider.request(.getPhotos(userId: userId, albumId: albumId)) { result in
            switch result {
            case .success(let response):
                guard let photos = try? JSONDecoder().decode([PhotoModel].self, from: response.data) else { return handler([]) }
                handler(photos)
            case .failure(let error):
                print("Error: \(error)")
                handler([])
            }
        }
    }
}
