//
//  UserView.swift
//  Presentation
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

import SwiftUI
import Domain

public struct UserView: View {
    @ObservedObject var viewModel: UserViewModel

    @State private var searchText = ""

    public var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List(viewModel.users.filter { searchText.isEmpty ? true : $0.username.lowercased().contains(searchText) }) { user in
                    NavigationLink(destination: Text("Details")) {
                        UserCell(user: user)
                    } // NavigationLink
                } // List
                .navigationTitle(Text("Users"))
            } // VStack
        } // NavigationView
        .onAppear(perform: viewModel.getUsers)
    }

    public init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
}

fileprivate struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.autocorrectionType = .no
        searchBar.placeholder = "Search username"
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

fileprivate struct UserCell: View {
    var user: UserEntity

    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
            Text(user.username)
                .font(.subheadline)
            Text(user.email)
                .font(.subheadline)
            Text(user.phone)
                .font(.subheadline)
            Text(user.website)
                .font(.subheadline)
        } // VStack
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
