//
//  UploadPostView.swift
//  InstaClone
//
//  Created by Dariy Kutelov on 25.08.23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack() {
            HStack() {
                Button {
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex = 0
                } label: {
                    Text("Cancel")
                }
                
                Text("New Post")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                
                Button {
                    print("New upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)

                }
            }
            .frame(maxWidth: .infinity)
            
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(12)
                        .clipped()
                } else {
                    VStack {
                        Image(systemName: "photo.fill")
                            .foregroundStyle(.black.opacity(0.7))
                            .font(.system(size: 32))
                    }
                    .frame(width: 100, height: 100)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.gray.opacity(0.2))
                    )
                }
                
                TextField("Enter Your Caption ...",
                          text: $caption,
                          axis: .vertical
                )
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(
            isPresented: $imagePickerPresented,
            selection: $viewModel.selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
