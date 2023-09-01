//
//  PostGridView.swift
//  InstaClone
//
//  Created by Dari Kutelov on 25.08.23.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @StateObject var viewModel: PostGridViewViewModel
    
    private let imageDimension:  CGFloat = UIScreen.main.bounds.width / 3 - 1
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    init(user: User) {
        self._viewModel = StateObject(
            wrappedValue: PostGridViewViewModel(user: user)
        )
    }
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string:post.imageUrl))
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(
            user: User.MOCK_USERS[0]
        )
    }
}
