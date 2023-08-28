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
    
    @MainActor
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {
            return
        }
        
        guard let uiImage = UIImage(data: data) else { return }
        
        profileImage = Image(uiImage: uiImage)
    }
}
