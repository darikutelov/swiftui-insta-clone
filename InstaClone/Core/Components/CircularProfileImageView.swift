//
//  CircularProfileImageView.swift
//  InstaClone
//
//  Created by Dariy Kutelov on 29.08.23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 60
        case .medium:
            return 80
        case .large:
            return 100
        }
    }
}

struct CircularProfileImageView: View {
    let user: User
    var size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(
                    width: size.dimension,
                    height: size.dimension
                )
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(
                    width: size.dimension,
                    height: size.dimension
                )
                .clipShape(Circle())
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(
            user: User.MOCK_USERS[0],
            size: .large
        )
    }
}
