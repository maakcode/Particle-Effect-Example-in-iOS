import SwiftUI
import SpriteKit

struct SnowView: View {
    @StateObject var scene = SnowScene()
    
    var body: some View {
        ZStack {
            Image("Santiago Gomez")
                .resizable()
                .scaledToFill()
            SpriteView(scene: scene, options: [.allowsTransparency])
        }
        .preferredColorScheme(.dark)
    }
}

struct SnowView_Previews: PreviewProvider {
    static var previews: some View {
        SnowView()
    }
}
