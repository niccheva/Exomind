//
//  PhotosView.swift
//  Presentation
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import SwiftUI
import Domain

struct PhotoView: View {
    @ObservedObject var viewModel: PhotoViewModel

    let appDependencies: AppDependenciesInterface
    let user: UserEntity
    let album: AlbumEntity

    var body: some View {
        List(viewModel.photos) { photo in
            Text(photo.title)
        } // List
        .navigationBarTitle(Text(album.title))
        .onAppear(perform: viewModel.getPhotos)
    }

    public init(user: UserEntity, album: AlbumEntity, appDependencies: AppDependenciesInterface, viewModel: PhotoViewModel) {
        self.user = user
        self.album = album
        self.appDependencies = appDependencies
        self.viewModel = viewModel
    }
}

//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoView()
//    }
//}
