//
//  PhotoModel.swift
//  Data
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import CoreData
import Domain

public struct PhotoModel: Codable {
    public let id: Int
    public let albumId: Int
    public let title: String
    public let url: String
    public let thumbnailUrl: String

    public var entity: PhotoEntity {
        PhotoEntity(
            id: id,
            albumId: albumId,
            title: title,
            url: url,
            thumbnailUrl: thumbnailUrl
        )
    }
}

extension ManagedPhoto {
    var model: PhotoModel {
        PhotoModel(
            id: Int(id),
            albumId: Int(albumId),
            title: title!,
            url: url!,
            thumbnailUrl: thumbnailUrl!
        )
    }

    convenience init(from photo: PhotoModel) {
        self.init(context: CoreDataManager.shared.context)
        id = Int16(photo.id)
        albumId = Int16(photo.albumId)
        title = photo.title
        url = photo.url
        thumbnailUrl = photo.thumbnailUrl
    }
}
