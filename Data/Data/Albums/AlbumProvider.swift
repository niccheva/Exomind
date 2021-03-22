//
//  AlbumProvider.swift
//  Data
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import Moya

public enum AlbumProvider {
    case getAlbums(userId: Int)
}

extension AlbumProvider: TargetType {
    public var baseURL: URL {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com") else {
            fatalError("baseURL is invalid, please check it in AlbumProvider")
        }
        return url
    }

    public var path: String {
        switch self {
        case .getAlbums(let userId):
            return "/users/\(userId)/albums"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .getAlbums:
            return .get
        }
    }

    public var sampleData: Data {
        Data()
    }

    public var task: Task {
        switch self {
        case .getAlbums(let userId):
            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.queryString)
        }
    }

    public var headers: [String : String]? {
        [ "Content-Type": "application/json" ]
    }
}
