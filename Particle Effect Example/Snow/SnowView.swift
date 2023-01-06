import SwiftUI
import SpriteKit

struct SnowView: View {
    @StateObject var scene = SnowScene()
    
    var body: some View {
        ZStack {
            Image("Santiago Gomez")
                .resizable()
                .aspectRatio(contentMode: .fill)
            SpriteView(scene: scene, options: [.allowsTransparency])
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SnowView_Previews: PreviewProvider {
    static var previews: some View {
        SnowView()
    }
}
