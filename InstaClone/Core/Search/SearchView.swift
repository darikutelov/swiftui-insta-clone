//
//  SearchView.swift
//  InstaClone
//
//  Created by Dari Kutelov on 9.08.23.
//

import SwiftUI

struct SearchView: View {
  @State private var searchText: String = ""
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(alignment: .leading, spacing: 12) {
          ForEach(User.MOCK_USERS) { user in
            NavigationLink(value: user) {
              HStack {
                Image(user.profileImageUrl ?? "avatar")
                  .resizable()
                  .scaledToFill()
                  .frame(width: 40, height: 40)
                  .clipShape(Circle())
                VStack(alignment: .leading, spacing: 0) {
                  Text(user.username)
                    .fontWeight(.semibold)
                  if let fullname = user.fullname {
                    Text(fullname)
                  }
                }
                .font(.footnote)
              }
              .foregroundStyle(.black)
              .padding(.horizontal)
            }
          }
        }
        .navigationDestination(for: User.self, destination: { user in
          ProfileView(user: user)
        })
        .searchable(text: $searchText, prompt: "Search")
        .padding(.top, 8)
      }
      .navigationTitle("Explore")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
