//
//  ProfileView.swift
//  InstaClone
//
//  Created by Dari Kutelov on 8.08.23.
//

import SwiftUI

struct ProfileView: View {
  
  let user: User
  
  var posts: [Post] {
    Post.MOCK_POSTS.filter { $0.user?.username == user.username
    }
  }
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      // Header
      ProfileHeaderView(user: user)
      
      // Posts grid view
      PostGridView(posts: posts)
    }
    .padding(.horizontal)
    .navigationTitle("Profile")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView(user: User.MOCK_USERS[0])
  }
}
