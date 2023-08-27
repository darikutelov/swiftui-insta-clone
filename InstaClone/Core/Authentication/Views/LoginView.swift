//
//  LoginView.swift
//  InstaClone
//
//  Created by Dari Kutelov on 9.08.23.
//

import SwiftUI

struct LoginView: View {
  @State private var email: String = ""
  @State private var password: String = ""
  
  var body: some View {
    NavigationStack {
      VStack {
        Spacer()
        
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 220, height: 100)
        
        VStack {
          TextField("Enter your email", text: $email)
            .autocapitalization(.none)
            .modifier(IGTextFieldModifier())
          
          SecureField("Enter your password", text: $password)
            .modifier(IGTextFieldModifier())
          
        }
        Button {
          //
        } label: {
          Text("Forgot Password?")
            .font(.footnote)
            .fontWeight(.semibold)
            .padding(.top, 10)
            .padding(.trailing, 28)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        
        Button {
          //
        } label: {
          Text("Log In")
            .modifier(IGButtonModifier())
        }
        .padding(.vertical)
        
        HStack {
          Rectangle()
            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
          
          Text("OR")
            .font(.footnote)
            .fontWeight(.semibold)
          
          Rectangle()
            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
        }
        .foregroundStyle(.gray)
        
        HStack {
          Image("fb")
            .resizable()
            .frame(width: 30,  height: 30)
          Text("Continue with Facebook")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(Color(.systemBlue))
        }
        .padding(.top, 8)
        
        Spacer()
        
        Divider()
        
        NavigationLink {
          AddEmailView()
            .navigationBarBackButtonHidden(true)
        } label: {
          HStack(spacing: 3) {
            Text("Don't have an account?")
            Text("Sign Up")
              .fontWeight(.semibold)
          }
          .font(.footnote)
        }
        .padding(.vertical,  16)
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
