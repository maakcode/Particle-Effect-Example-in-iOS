import UIKit

extension UIView {
    func asUIImage() -> UIImage? {
        let format = UIGraphicsImageRendererFormat()
        format.opaque = false
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(size: bounds.size, format: format)
        
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
