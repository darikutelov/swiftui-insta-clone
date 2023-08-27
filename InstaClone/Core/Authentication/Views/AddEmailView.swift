//
//  AddEmailView.swift
//  InstaClone
//
//  Created by Dari Kutelov on 9.08.23.
//

import SwiftUI

struct AddEmailView: View {
  @State private var email: String = ""
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack(spacing: 12) {
      Text("Add your email")
        .font(.title2)
        .bold()
        .padding(.top)
      
      Text("You'll use this email to sign in to your account")
        .font(.footnote)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 24)
      
      TextField("Email", text: $email)
        .autocapitalization(.none)
        .modifier(IGTextFieldModifier())
        .padding(.top)
      
      NavigationLink {
        CreateUsernameView()
          .navigationBarBackButtonHidden(true)
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

struct AddEmailView_Previews: PreviewProvider {
  static var previews: some View {
    AddEmailView()
  }
}
