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
            PhotoCell(photo: photo)
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

struct PhotoCell: View {
    let photo: PhotoEntity

    var body: some View {
        VStack {
            Text(photo.title)
            RemoteImage(url: photo.url)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
        } // VStack
    }
}

//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoView()
//    }
//}
