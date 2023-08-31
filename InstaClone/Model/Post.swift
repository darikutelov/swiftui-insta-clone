//
//  Post.swift
//  InstaClone
//
//  Created by Dari Kutelov on 10.08.23.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
  let id: String
  let ownerId: String
  let caption: String
  var likes: Int
  let imageUrl: String
  let timestamp: Timestamp
  var user: User?
}

extension Post {
  static var MOCK_POSTS: [Post] = [
    .init(
      id: NSUUID().uuidString,
      ownerId: NSUUID().uuidString,
      caption: "This is a test caption 1",
      likes: 123,
      imageUrl: "m-1",
      timestamp: Timestamp(),
      user: User.MOCK_USERS[0]
    ),
    .init(
      id: NSUUID().uuidString,
      ownerId: NSUUID().uuidString,
      caption: "This is a test caption 2",
      likes: 124,
      imageUrl: "m-2",
      timestamp: Timestamp(),
      user: User.MOCK_USERS[1]
    ),
    .init(
      id: NSUUID().uuidString,
      ownerId: NSUUID().uuidString,
      caption: "This is a test caption 3",
      likes: 125,
      imageUrl: "m-3",
      timestamp: Timestamp(),
      user: User.MOCK_USERS[2]
    )
  ]
}
