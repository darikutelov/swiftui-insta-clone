//
//  UploadPostViewModel.swift
//  InstaClone
//
//  Created by Dariy Kutelov on 25.08.23.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(from: selectedImage)
            }
        }
    }
    
    @Published var postImage: Image?
    private var uiImage: UIImage?
    private var dari: Bool = true
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else {
            return
        }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = self.uiImage else { return }
        
        // get post uid
        let postRef = Firestore.firestore().collection("posts").document()
        
        // upload image
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        
        // create posr
        let post = Post(
            id: postRef.documentID,
            ownerId: uid,
            caption: caption,
            likes: 0,
            imageUrl: imageUrl,
            timestamp: Timestamp()
        )
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
}
