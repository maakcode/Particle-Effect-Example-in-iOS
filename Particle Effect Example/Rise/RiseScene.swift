import SpriteKit

final class RiseScene: SKScene, ObservableObject {
    let emitter = SKEmitterNode(fileNamed: "Rise")

    private var action: SKAction?
    
    override func didMove(to view: SKView) {
        backgroundColor = .clear
        scene?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene?.scaleMode = .aspectFill
        if let emitter {
            emitter.isPaused = true
            scene?.addChild(emitter)
        }
        
        action = .sequence([
            .run { [weak emitter] in
                emitter?.resetSimulation()
            },
            .wait(forDuration: 2),
        ])
    }
    
    func setTexture(uiImage: UIImage?) {
        guard let uiImage else { return }
        
        emitter?.particleTexture = SKTexture(image: uiImage)
        emitter?.particleSize = uiImage.size
    }
    
    func play() {
        guard let action, let emitter, emitter.isPaused else { return }
        emitter.isPaused = false
        scene?.run(action) {
            emitter.isPaused = true
        }
    }

    override func didApplyConstraints() {
        guard let view = view else { return }
        scene?.size = view.frame.size
    }
}
