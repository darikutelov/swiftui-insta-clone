//
//  LoginViewModel.swift
//  InstaClone
//
//  Created by Dariy Kutelov on 27.08.23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func userLogin() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
