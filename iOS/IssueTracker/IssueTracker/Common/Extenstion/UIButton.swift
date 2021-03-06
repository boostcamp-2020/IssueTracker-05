//
//  UIButton.swift
//  IssueTracker
//
//  Created by cho on 2020/11/03.
//  Copyright © 2020 ralph. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    func makeTagStyle(_ tagColor: UIColor? = nil) {
        self.cornerRadius = 10
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = tagColor ?? UIColor(
            red: 42/255, green: 193/255, blue: 188/255, alpha: 1.0)
        self.contentEdgeInsets = UIEdgeInsets(top: 3, left: 8, bottom: 4, right: 8)
    }
}

extension UIButton {
    func configureButtonInDetailEditing() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 1.0
        self.layer.cornerRadius = 5
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}
