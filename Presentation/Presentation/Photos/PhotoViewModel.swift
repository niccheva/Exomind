//
//  PhotoViewModel.swift
//  Presentation
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import Domain

public class PhotoViewModel: ObservableObject {
    @Published var photos: [PhotoEntity] = []

    let userId: Int
    let albumId: Int

    private var interactor: PhotoInteractorInterface

    public init(userId: Int, albumId: Int, interactor: PhotoInteractorInterface) {
        self.userId = userId
        self.albumId = albumId
        self.interactor = interactor
    }

    func getPhotos() {
        interactor.getPhotos(userId: userId, albumId: albumId) { [weak self] photos in
            DispatchQueue.main.async {
                self?.photos = photos
            }
        }
    }
}
