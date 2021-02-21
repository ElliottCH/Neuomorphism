//
//  View+Extension.swift
//  NeumorPhism
//
//  Created by Elliott Chkayben on 2021-02-21.
//

import SwiftUI

extension View {
    public func softInnerShadow<S : Shape>(_ content: S, darkShadow: Color, lightShadow: Color, spread: CGFloat = 0.5, radius: CGFloat = 10) -> some View {
        modifier(
            SoftInnerShadowViewModifier(shape: content, darkShadowColor: darkShadow, lightShadowColor: lightShadow, spread: spread, radius: radius)
        )
    }
}

extension View {
  func inverseMask<Mask>(_ mask: Mask) -> some View where Mask: View {
    self.mask(mask
      .foregroundColor(.black)
      .background(Color.white)
      .compositingGroup()
      .luminanceToAlpha()
    )
  }
}
