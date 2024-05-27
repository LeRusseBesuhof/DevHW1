import Foundation
import UIKit

final class AppUI {
    
    static func createTextField(withSize size: CGRect) -> UITextField {
        {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 12
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: $0.frame.height))
            $0.leftView = leftView
            $0.leftViewMode = .always
            return $0
        }(UITextField(frame: size))
    }
    
    static func createLabel(withSize size: CGRect, text: String, textColor: UIColor, textAlignment: NSTextAlignment, fontSize: CGFloat, fontWeight: UIFont.Weight) -> UILabel {
        {
            $0.text = text
            $0.textColor = textColor
            $0.textAlignment = textAlignment
            $0.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
            $0.numberOfLines = 0
            return $0
        }(UILabel(frame: size))
    }
    
    static func createTitleView(withSize size: CGRect, titleText: String) -> UIView {
        {
            $0.addSubview(AppUI.createLabel(
                withSize: CGRect(x: 0, y: 0, width: $0.frame.width, height: 40),
                text: titleText, textColor: .white, textAlignment: .center,
                fontSize: 34, fontWeight: .bold))
            return $0
        }(UIView(frame: size))
    }
    
    static func createButton(withSize size: CGRect, titleText: String, titleColor: UIColor, bgColor: UIColor, action: UIAction) -> UIButton {
        {
            $0.backgroundColor = bgColor
            $0.layer.cornerRadius = 15
            $0.setTitle(titleText, for: .normal)
            $0.setTitleColor(titleColor, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            $0.addAction(action, for: .touchDown)
            return $0
        }(UIButton(frame: size))
    }
    
    static func createImageView(withSize size: CGRect, image: String) -> UIImageView {
        {
            $0.image = UIImage(named: image)
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            return $0
        }(UIImageView(frame: size))
    }
    
    // delete
    static func createView(withBGColor color: UIColor, cornerRadius: CGFloat, image: String, text: String) -> UIView {
        {
            $0.backgroundColor = color
            $0.layer.cornerRadius = cornerRadius
            let imageView = AppUI.createImageView(withSize: CGRect(x: 12, y: 10, width: 24, height: 24), image: image)
            let textLabel = AppUI.createLabel(
                withSize: CGRect(x: imageView.frame.maxX + 27, y: 15, width: $0.frame.width - imageView.frame.width - 54, height: 14),
                text: text, textColor: .white, textAlignment: .left,
                fontSize: 14, fontWeight: .bold)
            // [imageView, textLabel].forEach { }
            return $0
        }(UIView())
    }
    
    static func createProfileButton(image: String, text: String) -> UIButton {
        let btnConfig : UIButton.Configuration = {
            return $0
        }(UIButton.Configuration.plain())
        
        return {
            $0.backgroundColor = .appProfileCell
            $0.layer.cornerRadius = 5
            $0.setImage(UIImage(named: image), for: .normal)
            $0.setTitle(text, for: .normal)
            $0.configuration?.imagePlacement = .leading
            $0.configuration?.imagePadding = 27
            $0.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 10)
            return $0
        }(UIButton(configuration: btnConfig, primaryAction: UIAction(handler: { _ in
            print("Открыть \(text)")
        })))
    }
}
