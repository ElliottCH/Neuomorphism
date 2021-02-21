//
//  SoftInnerShadowViewModifier.swift
//  NeumorPhism
//
//  Created by Elliott Chkayben on 2021-02-20.
//
//  Credit to Costa Chung, checkout his full example https://github.com/costachung/neumorphic
//

import SwiftUI

private struct SoftInnerShadowViewModifier<S: Shape> : ViewModifier {
    var shape: S
    var darkShadowColor : Color = .black
    var lightShadowColor : Color = .white
    var spread: CGFloat = 0.5    //The value of spread is between 0 to 1. Higher value makes the shadow look more intense.
    var radius: CGFloat = 10
    
    init(shape: S, darkShadowColor: Color, lightShadowColor: Color, spread: CGFloat, radius:CGFloat) {
        self.shape = shape
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
        self.spread = spread
        self.radius = radius
    }

    fileprivate func strokeLineWidth(_ geo: GeometryProxy) -> CGFloat {
        return geo.size.width * 0.10
    }
    
    fileprivate func strokeLineScale(_ geo: GeometryProxy) -> CGFloat {
        let lineWidth = strokeLineWidth(geo)
        return geo.size.width / CGFloat(geo.size.width - lineWidth)
    }
    
    fileprivate func shadowOffset(_ geo: GeometryProxy) -> CGFloat {
        return (geo.size.width <= geo.size.height ? geo.size.width : geo.size.height) * 0.5 * min(max(spread, 0), 1)
    }
    

    fileprivate func addSoftInnerShadow(_ content: SoftInnerShadowViewModifier.Content) -> some View {
        return GeometryReader { geo in
            
            self.shape.fill(self.lightShadowColor)
                .inverseMask(
                    self.shape
                    .offset(x: -self.shadowOffset(geo), y: -self.shadowOffset(geo))
                )
                .offset(x: self.shadowOffset(geo) , y: self.shadowOffset(geo))
                .blur(radius: self.radius)
                .shadow(color: self.lightShadowColor, radius: self.radius, x: -self.shadowOffset(geo)/2, y: -self.shadowOffset(geo)/2 )
                .mask(
                    self.shape
                )
                .overlay(
                    addOverlay(geo)
                )
                .mask(
                    self.shape
                )
        }
    }
    
    fileprivate func addOverlay(_ geo: GeometryProxy) -> some View {
        self.shape
            .fill(self.darkShadowColor)
            .inverseMask(
                self.shape
                .offset(x: self.shadowOffset(geo), y: self.shadowOffset(geo))
            )
            .offset(x: -self.shadowOffset(geo) , y: -self.shadowOffset(geo))
            .blur(radius: self.radius)
            .shadow(color: self.darkShadowColor, radius: self.radius, x: self.shadowOffset(geo)/2, y: self.shadowOffset(geo)/2 )
    }

    func body(content: Content) -> some View {
        content.overlay(
            addSoftInnerShadow(content)
        )
    }
}

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
