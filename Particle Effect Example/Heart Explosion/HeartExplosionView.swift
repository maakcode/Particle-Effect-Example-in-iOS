import SwiftUI
import SpriteKit

struct HeartExplosionView: View {
    @StateObject var scene = ExplosionScene()
    @State var imageColor: Color = .pink
    @State var imageFrame: CGRect = .zero
    
    let color: [Color] = [.pink, .blue, .red, .teal, .mint, .purple, .indigo]
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene, options: [.allowsTransparency])
            renderImage()
                .onFrameChange {
                    imageFrame = $0
                }
        }
        .onTapGesture {
            let content = renderImage().frame(width: imageFrame.width, height: imageFrame.height)
            let image = ImageRenderer(content: content).uiImage
            scene.setTexture(uiImage: image)
            scene.play {
                imageColor = color.randomElement() ?? .pink
            }
        }
    }
    
    func renderImage() -> some View {
        Image(systemName: "heart.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(imageColor)
            .frame(width: 100, height: 100)
    }
}

struct HeartExplosionView_Previews: PreviewProvider {
    static var previews: some View {
        HeartExplosionView()
    }
}
