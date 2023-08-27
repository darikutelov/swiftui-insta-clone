//
//  FinalSignUpView.swift
//  InstaClone
//
//  Created by Dari Kutelov on 10.08.23.
//

import SwiftUI

struct FinalSignUpView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Welcome to Instagram, \(viewModel.username)")
                .font(.title2)
                .bold()
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("Click below to complete registration and start using Instagram.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            
            Button {
                Task {
                    try await viewModel.createUser()
                }
            } label: {
                Text("Complete Sign Up")
                    .modifier(IGButtonModifier())
            }
            .padding(.vertical)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct FinalSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        FinalSignUpView()
    }
}
