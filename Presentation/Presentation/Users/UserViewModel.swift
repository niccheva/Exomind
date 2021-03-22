//
//  UserViewModel.swift
//  Presentation
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

import Domain

public class UserViewModel: ObservableObject {
    @Published var users: [UserEntity] = []

    private var interactor: UserInteractorInterface

    public init(interactor: UserInteractorInterface) {
        self.interactor = interactor
    }

    func getUsers() {
        interactor.getUsers { [weak self] users in
            DispatchQueue.main.async {
                self?.users = users
            }
        }
    }
}
