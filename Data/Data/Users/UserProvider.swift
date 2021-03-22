//
//  UserProvider.swift
//  Data
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

import Moya

public enum UserProvider {
    case getUsers
}

extension UserProvider: TargetType {
    public var baseURL: URL {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com") else {
            fatalError("baseURL is invalid, please check it in UserProvider")
        }
        return url
    }

    public var path: String {
        switch self {
        case .getUsers:
            return "/users"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .getUsers:
            return .get
        }
    }

    public var sampleData: Data {
        Data()
    }

    public var task: Task {
        switch self {
        case .getUsers:
            return .requestPlain
        }
    }

    public var headers: [String : String]? {
        [ "Content-Type": "application/json" ]
    }
}
