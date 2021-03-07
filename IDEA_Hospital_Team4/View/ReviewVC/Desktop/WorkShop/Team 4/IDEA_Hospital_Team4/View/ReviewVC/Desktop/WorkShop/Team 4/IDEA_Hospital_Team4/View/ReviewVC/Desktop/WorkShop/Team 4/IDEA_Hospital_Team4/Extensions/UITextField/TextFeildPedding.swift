
import UIKit

extension UITextField{
    func leftPadding(image: UIImage , leftViewState:stateIcon,widthIcon:Double, heightIcone:Double) {
        let leftIcon = UIImageView(image: image)
        leftIcon.frame.size = CGSize(width: widthIcon, height: heightIcone)
        self.leftViewMode = UITextField.ViewMode.always
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: widthIcon, height:heightIcone))
        leftIcon.center = leftPadding.center
        leftPadding.addSubview(leftIcon)
        self.leftView = leftPadding
        switch leftViewState{
        case .background:
            //setUnderLine()
            return print("")
            
        case .image:
            return (leftView?.backgroundColor = UIColor(patternImage: UIImage(named: "iconBlue")!))!
        }
        self.layer.masksToBounds = true
    }
    
    func rightPadding() {
        let rightIcon = UIImageView(image: UIImage(named: "arrowdown"))
        self.rightViewMode = UITextField.ViewMode.always
        self.rightView = rightIcon
    }
    func setupPlaceholder(text: String) {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: FontFamily.PTSans.regular.font(size: 20),
            .foregroundColor: UIColor.white.withAlphaComponent(0.6)
        ]
        let attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
        self.attributedPlaceholder = attributedPlaceholder
    }
}

class PaddedTextField: UITextField {
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rightBounds = CGRect(x: bounds.size.width-33, y: bounds.size.height/3, width: 20, height: 11.4)
        return rightBounds
    }
    
}
enum stateIcon{
    case image,background
}

extension UITextField {
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width , height: self.frame.size.height)
        border.borderWidth = width
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
