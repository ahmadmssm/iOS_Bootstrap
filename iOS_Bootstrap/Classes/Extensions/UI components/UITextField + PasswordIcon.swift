//
//  UITextField + PasswordIcon.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 2/15/19.
//

fileprivate var extensionPasswordImageButton: UIButton?

public extension UITextField {
    
    public enum Direction {
        case Left
        case Right
    }
    
    public var passwordIcon: UIButton? { return extensionPasswordImageButton }
    
    public final func AddImage(direction:Direction, image: UIImage, Frame: CGRect, backgroundColor: UIColor) {
        let View = UIView(frame: Frame)
        View.backgroundColor = backgroundColor
        let imageButton = UIButton(frame: Frame)
        imageButton.contentMode = .center
        imageButton.setImage(image, for: .normal)
        extensionPasswordImageButton = imageButton
        View.addSubview(imageButton)
        if Direction.Left == direction {
            self.leftViewMode = .always
            self.leftView = View
        }
        else {
            self.rightViewMode = .always
            self.rightView = View
        }
    }
    
    func willDeinit() { extensionPasswordImageButton = nil }
    
}
