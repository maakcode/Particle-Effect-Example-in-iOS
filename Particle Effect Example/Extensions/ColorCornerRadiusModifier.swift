import SwiftUI

struct ColorCornerRadiusModifier: ViewModifier {
    let radius: CGFloat
    let color: Color
    let lineWidth: CGFloat

    func body(content: Content) -> some View {
        content
            .cornerRadius(radius)
            .overlay {
                RoundedRectangle(cornerRadius: radius)
                    .stroke(color, lineWidth: lineWidth)
            }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, color: Color, lineWidth: CGFloat) -> some View {
        modifier(ColorCornerRadiusModifier(radius: radius, color: color, lineWidth: lineWidth))
    }
}
