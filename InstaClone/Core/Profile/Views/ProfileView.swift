//
//  ProfileView.swift
//  InstaClone
//
//  Created by Dari Kutelov on 8.08.23.
//

import SwiftUI

struct ProfileView: View {
  
  let user: User
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      // Header
      ProfileHeaderView(user: user)
      
      // Posts grid view
      PostGridView(user: user)
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
