//
//  FeedCell.swift
//  InstaClone
//
//  Created by Dari Kutelov on 9.08.23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading) {
            // Image & username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xSmall)
                    
                    if let fullname = user.fullname {
                        Text(fullname)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
            }
            .padding(.leading, 8)
            
            // Post image
            KFImage(URL(string:post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // Action buttons
            HStack(spacing: 12) {
                Button {
                    //
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    //
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    //
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundStyle(.black)
            .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 2) {
                // Likes label
                Text("\(post.likes) likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                // Caption label - plus makes it like one text
                HStack {
                    if let username = post.user?.username {
                        Text("\(username) ").fontWeight(.semibold) +
                        Text(post.caption)
                    }
                }
                .font(.footnote)
                
                Text("6H ago")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 10)
            .padding(.top, 1)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[0])
    }
}
