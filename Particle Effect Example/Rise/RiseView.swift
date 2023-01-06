import SwiftUI
import SpriteKit

struct RiseView: View {
    @StateObject var scene = RiseScene()
    @State var cardFrame: CGRect = .zero
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene, options: [.allowsTransparency])
            renderCard()
                .padding()
                .onFrameChange {
                    cardFrame = $0
                }
                .onTapGesture {
                    let content = renderCard().frame(width: cardFrame.width, height: cardFrame.height)
                    let renderer = ImageRenderer(content: content)
                    scene.setTexture(uiImage: renderer.uiImage)
                    scene.play()
                }
        }
        
    }
    
    func renderCard() -> some View {
        HStack {
            Image("tabitha turner")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(8, color: .gray, lineWidth: 1)
            VStack(alignment: .leading, spacing: 4) {
                Text("A Cup of Coffee")
                    .fontWeight(.semibold)
                Text("Photo by tabitha turner on Unsplash")
                    .foregroundColor(.gray)
            }
        }
        .padding(10)
        .background(Color(uiColor: .tertiarySystemGroupedBackground))
        .cornerRadius(12)
    }
}

struct RiseView_Previews: PreviewProvider {
    static var previews: some View {
        RiseView()
    }
}
