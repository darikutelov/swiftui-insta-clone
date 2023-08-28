//
//  RegistrationViewModel.swift
//  InstaClone
//
//  Created by Dariy Kutelov on 27.08.23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var  username = ""
    @Published var  email = ""
    @Published var  password = ""
    
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        await MainActor.run {
            username = ""
            email = ""
            password = ""
        }
    }
}
