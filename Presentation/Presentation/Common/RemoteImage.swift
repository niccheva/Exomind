//
//  RemoteImage.swift
//  Presentation
//
//  Created by Nicolas Chevalier on 22/03/2021.
//

import SwiftUI

struct RemoteImage: View {
    @StateObject private var loader: Loader

    var body: some View {
        image.resizable()
    }

    init(url: String) {
        _loader = StateObject(wrappedValue: Loader(urlString: url))
    }

    private var image: Image {
        let failureImage = Image(systemName: "multiply.circle")

        switch loader.state {
        case .loading:
            return Image(systemName: "photo")
        case .failure:
            return failureImage
        case .success:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failureImage
            }
        }
    }

    private enum LoadState {
        case loading
        case success
        case failure
    }

    private class Loader: ObservableObject {
        static let cache: NSCache<NSString, NSData> = NSCache()

        var data: Data!
        var state: LoadState = .loading

        init(urlString: String) {
            if let data = Self.cache.object(forKey: urlString as NSString) {
                self.data = data as Data
                self.state = .success
                self.objectWillChange.send()
                return
            }

            guard let url = URL(string: urlString) else {
                self.state = .failure
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, !data.isEmpty {
                    Self.cache.setObject(data as NSData, forKey: urlString as NSString)
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(url: "https://via.placeholder.com/600/8e973b")
            .shadow(radius: 10)
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
    }
}
