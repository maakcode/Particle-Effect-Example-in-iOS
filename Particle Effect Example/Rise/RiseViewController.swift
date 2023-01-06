import UIKit
import SpriteKit
import SwiftUI

final class RiseViewController: UIViewController {
    let titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        view.textColor = .label
        view.text = "A Cup of Coffee"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let subtitleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 3
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .gray
        view.text = "Photo by tabitha turner on Unsplash"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "tabitha turner")
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let container: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let labelStack: UIStackView = {
        let view = UIStackView()
        view.spacing = 4
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scene: RiseScene = {
        let scene = RiseScene()
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
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(playAnimation))
        container.addGestureRecognizer(tapRecognizer)
    }

    private func addViews() {
        paticleView.presentScene(scene)
        [paticleView, container].forEach {
            view.addSubview($0)
        }
        [titleLabel, subtitleLabel].forEach {
            labelStack.addArrangedSubview($0)
        }
        [imageView, labelStack].forEach {
            container.addSubview($0)
        }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            imageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),

            labelStack.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            labelStack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            labelStack.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            labelStack.widthAnchor.constraint(equalToConstant: 160),
        ])

        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            paticleView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            paticleView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            paticleView.widthAnchor.constraint(equalTo: view.widthAnchor),
            paticleView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }

    @objc private func playAnimation() {
        let image = container.asUIImage()
        scene.setTexture(uiImage: image)
        scene.play()
    }
}

// MARK: - UIViewControllerRepresentable

struct RiseUIView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        RiseViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}


struct RiseUIView_Previews: PreviewProvider {
    static var previews: some View {
        RiseUIView()
    }
}
