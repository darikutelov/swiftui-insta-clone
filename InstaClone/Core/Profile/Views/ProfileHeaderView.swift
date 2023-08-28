//
//  ProfileHeaderView.swift
//  InstaClone
//
//  Created by Dari Kutelov on 25.08.23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                Image(user.profileImageUrl ?? "avatar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatView(value: 3, title: "Posts")
                    
                    UserStatView(value: 12, title: "Followers")
                    
                    UserStatView(value: 1, title: "Following")
                }
            }
            
            // Name and bio
            VStack(alignment: .leading, spacing: 2) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text(user.username)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // action button
            Button {
                if user.isCurrentUser {
                    // edit profile
                    showEditProfile.toggle()
                } else {
                    // follow
                    
                }
                
            } label: {
                Text(user.isCurrentUser ? "Edit profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(user.isCurrentUser ? .black : .white)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ?  Color.gray : .clear, lineWidth: 1)
                    )
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView()
        }
    }
}

struct ProfileHeader_View_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
