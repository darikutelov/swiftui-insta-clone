//
//  SearchView.swift
//  InstaClone
//
//  Created by Dari Kutelov on 9.08.23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                CircularProfileImageView(
                                    user: user,
                                    size: .xSmall
                                )
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
