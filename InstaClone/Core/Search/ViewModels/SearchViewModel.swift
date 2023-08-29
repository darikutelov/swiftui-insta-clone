//
//  SearchViewModel.swift
//  InstaClone
//
//  Created by Dariy Kutelov on 28.08.23.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    func fetchAllUsers() async throws {
        users = try await UserService.fetchAllUsers()
    }
}
