//
//  PhotoLocalDataSource.swift
//  Data
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import CoreData

public protocol PhotoLocalDataSourceInterface {
    func getPhotos(albumId: Int, handler: @escaping ([PhotoModel]) -> ())
    func save(photos: [PhotoModel]) throws
}

public class PhotoLocalDataSource: PhotoLocalDataSourceInterface {
    public init() {}

    public func getPhotos(albumId: Int, handler: @escaping ([PhotoModel]) -> ()) {
        let context = CoreDataManager.shared.context
        let request: NSFetchRequest<ManagedPhoto> = ManagedPhoto.fetchRequest()
        request.predicate = NSPredicate(format: "albumId == %d", albumId)

        if let photos = try? context.fetch(request) {
            handler(photos.map { $0.model })
        } else {
            handler([])
        }
    }

    public func save(photos: [PhotoModel]) throws {
        _ = photos.map(ManagedPhoto.init(from:))
        try CoreDataManager.shared.context.save()
    }
}
