//
//  CreatePasswordView.swift
//  InstaClone
//
//  Created by Dari Kutelov on 9.08.23.
//

import SwiftUI

struct CreatePasswordView: View {
  @State private var password: String = ""
  @Environment(\.dismiss) var dismiss
  
    var body: some View {
      VStack(spacing: 12) {
        Text("Create a password")
          .font(.title2)
          .bold()
          .padding(.top)
        
        Text("Your password must be at least 6 characters in length")
          .font(.footnote)
          .foregroundColor(.gray)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 24)
        
        SecureField("Password", text: $password)
          .modifier(IGTextFieldModifier())
          .padding(.top)
        
        NavigationLink {
          FinalSignUpView()
            .navigationBarBackButtonHidden()
        } label: {
          Text("Next")
            .modifier(IGButtonModifier())
        }
        .padding(.vertical)
        
        Spacer()
      }
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
