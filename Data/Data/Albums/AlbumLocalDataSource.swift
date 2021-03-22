//
//  AlbumLocalDataSource.swift
//  Data
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import CoreData

public protocol AlbumLocalDataSourceInterface {
    func getAlbums(userId: Int, handler: @escaping ([AlbumModel]) -> ())
    func save(albums: [AlbumModel]) throws
}

public class AlbumLocalDataSource: AlbumLocalDataSourceInterface {
    public init() {}

    public func getAlbums(userId: Int, handler: @escaping ([AlbumModel]) -> ()) {
        let context = CoreDataManager.shared.context
        let request: NSFetchRequest<ManagedAlbum> = ManagedAlbum.fetchRequest()
        request.predicate = NSPredicate(format: "userId == %d", userId)

        if let albums = try? context.fetch(request) {
            handler(albums.map { $0.model })
        } else {
            handler([])
        }
    }

    public func save(albums: [AlbumModel]) throws {
        _ = albums.map(ManagedAlbum.init(from:))
        try CoreDataManager.shared.context.save()
    }
}
