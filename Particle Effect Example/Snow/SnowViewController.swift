import UIKit
import SpriteKit
import SwiftUI

final class SnowViewController: UIViewController {

    let snowView: SKView = {
        let view = SKView()
        view.backgroundColor = .clear
        let scene = SnowScene()
        view.presentScene(scene)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let photo: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Santiago Gomez")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let credit: UILabel = {
        let view = UILabel()
        view.attributedText = {
            let normal: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 16, weight: .regular),
                .foregroundColor: UIColor.label,
            ]
            let underline: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 16, weight: .regular),
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .foregroundColor: UIColor.systemGray,
            ]

            var text = NSMutableAttributedString()
            [
                NSAttributedString(string: "Photo by ", attributes: normal),
                NSAttributedString(string: "Santiago Gomez", attributes: underline),
                NSAttributedString(string: " on ", attributes: normal),
                NSAttributedString(string: "Unsplash", attributes: underline),
            ].forEach {
                text.append($0)
            }

            return text
        }()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        overrideUserInterfaceStyle = .dark
        addViews()
        setConstraints()
    }
    
    private func addViews() {
        [photo, credit, snowView].forEach {
            view.addSubview($0)
        }
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            photo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photo.topAnchor.constraint(equalTo: view.topAnchor),
            photo.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            credit.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            credit.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            snowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            snowView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            snowView.topAnchor.constraint(equalTo: view.topAnchor),
            snowView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - UIViewControllerRepresentable

struct SnowUIView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        SnowViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct SnowUIView_Previews: PreviewProvider {
    static var previews: some View {
        SnowUIView()
            .edgesIgnoringSafeArea(.all)
    }
}
