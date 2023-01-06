import SpriteKit

final class ExplosionScene: SKScene, ObservableObject {
    let emitter = SKEmitterNode(fileNamed: "Explosion")

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
            .wait(forDuration: 1.5),
        ])
    }
    
    func setTexture(uiImage: UIImage?) {
        guard let uiImage else { return }
        
        emitter?.particleTexture = SKTexture(image: uiImage)
        emitter?.particleSize = uiImage.size
    }
    
    func play(completion handler: @escaping () -> Void = {}) {
        guard let action, let emitter, emitter.isPaused else { return }
        emitter.isPaused = false
        scene?.run(action) {
            emitter.isPaused = true
            handler()
        }
    }

    override func didApplyConstraints() {
        guard let view = view else { return }
        scene?.size = view.frame.size
    }
}
