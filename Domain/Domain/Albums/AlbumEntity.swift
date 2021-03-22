//
//  AlbumEntity.swift
//  Domain
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

public struct AlbumEntity: Identifiable {
    public let id: Int
    public let userId: Int
    public let title: String

    public init(id: Int, userId: Int, title: String) {
        self.id = id
        self.userId = userId
        self.title = title
    }
}
