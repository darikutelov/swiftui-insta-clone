//
//  Use.swift
//  InstaClone
//
//  Created by Dari Kutelov on 10.08.23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
  let id: String
  var username: String
  var profileImageUrl: String?
  var fullname: String?
  var bio: String?
  let email: String
    
    var isCurrentUser: Bool {
        guard let currentUserUid = Auth.auth().currentUser?.uid else { return false
        }
        
        return currentUserUid == self.id
    }
}

extension User {
  static var MOCK_USERS: [User] = [
    .init(
      id: NSUUID().uuidString,
      username: "Dariku",
      profileImageUrl: nil,
      fullname: "Dariy Kutelov" ,
      bio: "Learning all the time",
      email: "dari.k@abv.bg"
    ),
    .init(
      id: NSUUID().uuidString,
      username: "AliceMo",
      profileImageUrl: nil,
      fullname: "Alice Morisson" ,
      bio: "Alice is cool",
      email: "alice@abv.bg"
    ),
    .init(
      id: NSUUID().uuidString,
      username: "Barbara",
      profileImageUrl: nil,
      fullname: "Barbara Stevens" ,
      bio: "Barbara is cool",
      email: "barbara@abv.bg"
    )
  ]
}
