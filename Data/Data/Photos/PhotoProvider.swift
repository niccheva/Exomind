//
//  PhotoProvider.swift
//  Data
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import Moya

public enum PhotoProvider {
    case getPhotos(userId: Int, albumId: Int)
}

extension PhotoProvider: TargetType {
    public var baseURL: URL {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com") else {
            fatalError("baseURL is invalid, please check it in PhotoProvider")
        }
        return url
    }

    public var path: String {
        switch self {
        case .getPhotos(let userId, _):
            return "/users/\(userId)/photos"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .getPhotos:
            return .get
        }
    }

    public var sampleData: Data {
        Data()
    }

    public var task: Task {
        switch self {
        case .getPhotos(_, let albumId):
            return .requestParameters(parameters: ["albumId": albumId], encoding: URLEncoding.queryString)
        }
    }

    public var headers: [String : String]? {
        [ "Content-Type": "application/json" ]
    }
}
