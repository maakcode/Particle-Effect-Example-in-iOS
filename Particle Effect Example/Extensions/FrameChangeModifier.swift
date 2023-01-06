import SwiftUI

extension View {
    func onFrameChange(perform handler: @escaping (_ frame: CGRect) -> Void) -> some View {
        modifier(FrameChangeModifier())
            .onPreferenceChange(FrameChangePreferenceKey.self, perform: handler)
    }
}

struct FrameChangeModifier: ViewModifier {
    var frameView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: FrameChangePreferenceKey.self, value: geometry.frame(in: .local))
        }
    }

    func body(content: Content) -> some View {
        content.background(frameView)
    }
}

struct FrameChangePreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
