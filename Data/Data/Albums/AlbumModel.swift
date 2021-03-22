//
//  AlbumModel.swift
//  Data
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import CoreData
import Domain

public struct AlbumModel: Codable {
    public let id: Int
    public let userId: Int
    public let title: String

    public var entity: AlbumEntity {
        AlbumEntity(id: id, userId: userId, title: title)
    }
}

extension ManagedAlbum {
    var model: AlbumModel {
        AlbumModel(id: Int(id), userId: Int(userId), title: title!)
    }

    convenience init(from album: AlbumModel) {
        self.init(context: CoreDataManager.shared.context)
        id = Int16(album.id)
        userId = Int16(album.userId)
        title = album.title
    }
}
