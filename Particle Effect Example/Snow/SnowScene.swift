import SpriteKit
import SwiftUI

final class SnowScene: SKScene, ObservableObject {

    override func didMove(to view: SKView) {
        backgroundColor = .clear
        scene?.anchorPoint = CGPoint(x: 0.5, y: 1)
        scene?.scaleMode = .aspectFill
        
        if let snowNode = SKEmitterNode(fileNamed: "Snow") {
            scene?.addChild(snowNode)
        }
    }

    override func didApplyConstraints() {
        guard let view = view else { return }
        scene?.size = view.frame.size
    }
}
