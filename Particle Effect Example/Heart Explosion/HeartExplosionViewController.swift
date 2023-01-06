import UIKit
import SwiftUI
import SpriteKit

final class HeartExplosionViewController: UIViewController {
    let colors: [UIColor] = [.systemPink, .systemTeal, .systemMint, .systemBlue, .systemRed, .systemPurple, .systemIndigo]
    
    let imageButton: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "heart.fill"))
        view.tintColor = .systemPink
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scene: ExplosionScene = {
        let scene = ExplosionScene()
        scene.backgroundColor = .clear
        return scene
    }()
    
    let paticleView: SKView = {
        let view = SKView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addViews()
        setConstraints()
        
        let tabGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(playAnimation))
        imageButton.addGestureRecognizer(tabGestureRecognizer)
    }
    
    private func addViews() {
        paticleView.presentScene(scene)
        view.addSubview(paticleView)
        view.addSubview(imageButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageButton.widthAnchor.constraint(equalToConstant: 100),
            imageButton.heightAnchor.constraint(equalToConstant: 100),
            imageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            paticleView.centerXAnchor.constraint(equalTo: imageButton.centerXAnchor),
            paticleView.centerYAnchor.constraint(equalTo: imageButton.centerYAnchor),
            paticleView.widthAnchor.constraint(equalTo: view.widthAnchor),
            paticleView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }

    @objc private func playAnimation() {
        scene.setTexture(uiImage: imageButton.asUIImage())
        scene.play { [weak self] in
            guard let self else { return }

            self.imageButton.tintColor = self.colors.randomElement()
        }
    }
}

// MARK: - UIViewControllerRepresentable

struct HeartExplosionUIView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return HeartExplosionViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}


struct HeartExplosionUIView_Previews: PreviewProvider {
    static var previews: some View {
        HeartExplosionUIView()
    }
}
