//
//  AppDependencies.swift
//  Exomind
//
//  Created by Nicolas Chevalier on 20/03/2021.
//

import Presentation

class AppDependencies {
    func resolveUserDependencies() -> UserViewModel {
        UserDependencies().resolve()
    }
}
