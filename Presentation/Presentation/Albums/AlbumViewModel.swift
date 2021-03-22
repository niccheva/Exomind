//
//  AlbumViewModel.swift
//  Presentation
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import Domain

public class AlbumViewModel: ObservableObject {
    @Published var albums: [AlbumEntity] = []

    let userId: Int

    private var interactor: AlbumInteractorInterface

    public init(userId: Int, interactor: AlbumInteractorInterface) {
        self.userId = userId
        self.interactor = interactor
    }

    func getAlbums() {
        interactor.getAlbums(userId: userId) { [weak self] albums in
            DispatchQueue.main.async {
                self?.albums = albums
            }
        }
    }
}
