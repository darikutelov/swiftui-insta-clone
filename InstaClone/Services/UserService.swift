//
//  User.swift
//  InstaClone
//
//  Created by Dariy Kutelov on 28.08.23.
//

import Foundation
import Firebase

struct UserService {
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        let documents = snapshot.documents
  
        return snapshot.documents.compactMap {
            try? $0.data(as: User.self)
        }
    }
}
