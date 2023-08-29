//
//  ProfileViewModel.swift
//  InstaClone
//
//  Created by Dariy Kutelov on 28.08.23.
//

import Firebase
import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var fullname: String = ""
    @Published var bio: String = ""
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(from: selectedImage)
            }
        }
    }
    @Published var profileImage: Image?
    
    private var profileUIImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    @MainActor
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {
            return
        }
        
        guard let uiImage = UIImage(data: data) else { return }
        profileUIImage = uiImage
        profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String: Any]()

        // update profile image if changed
        if let profileUIImage = profileUIImage {
            let imageUrl = try await ImageUploader.uploadImage(image: profileUIImage)
            data["profileImageUrl"] = imageUrl
        }
        
        // update fullname if changed
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        // update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore()
                .collection("users")
                .document(user.id)
                .updateData(data)
        }
    }
}
