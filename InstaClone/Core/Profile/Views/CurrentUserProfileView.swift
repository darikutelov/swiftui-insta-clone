//
//  CurrentUserProfileView.swift
//  InstaClone
//
//  Created by Dari Kutelov on 10.08.23.
//

import SwiftUI

struct CurrentUserProfileView: View {
  let user: User
  
  var posts: [Post] {
    Post.MOCK_POSTS.filter { $0.user?.username == user.username
    }
  }
  
  var body: some View {
    NavigationStack {
      ScrollView(showsIndicators: false) {
        // Header
        ProfileHeaderView(user: user)
        
        // Posts grid view
        PostGridView(posts: posts)
      }
      .padding(.horizontal)
      .navigationTitle("Profile")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
              AuthService.shared.signout()
          } label: {
            Image(systemName: "line.3.horizontal")
              .foregroundStyle(.black)
          }
        }
      }
    }
  }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
  static var previews: some View {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
  }
}
