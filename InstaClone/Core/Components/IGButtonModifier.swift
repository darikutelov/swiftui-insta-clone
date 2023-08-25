//
//  IGButtonModifier.swift
//  InstaClone
//
//  Created by Dari Kutelov on 9.08.23.
//

import SwiftUI

struct IGButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.subheadline)
      .fontWeight(.semibold)
      .foregroundStyle(.white)
      .frame(width: 360, height: 44)
      .background(Color(.systemBlue))
      .cornerRadius(8)
  }
}
