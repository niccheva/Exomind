//
//  PhotoEntity.swift
//  Domain
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

public struct PhotoEntity: Identifiable {
    public let id: Int
    public let albumId: Int
    public let title: String
    public let url: String
    public let thumbnailUrl: String

    public init(
        id: Int,
        albumId: Int,
        title: String,
        url: String,
        thumbnailUrl: String
    ) {
        self.id = id
        self.albumId = albumId
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
}
