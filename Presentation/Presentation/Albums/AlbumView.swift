//
//  AlbumView.swift
//  Presentation
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import SwiftUI
import Domain

struct AlbumView: View {
    @ObservedObject var viewModel: AlbumViewModel

    let appDependencies: AppDependenciesInterface
    let user: UserEntity

    var body: some View {
        List(viewModel.albums) { album in
            NavigationLink(destination: Text("Album")) {
                Text(album.title)
            }
        } // List
        .navigationBarTitle(Text("\(user.username)'s Albums"))
        .onAppear(perform: viewModel.getAlbums)
    }

    public init(user: UserEntity, appDependencies: AppDependenciesInterface, viewModel: AlbumViewModel) {
        self.user = user
        self.appDependencies = appDependencies
        self.viewModel = viewModel
    }
}

//struct AlbumView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlbumView()
//    }
//}
