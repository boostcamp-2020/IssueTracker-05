//
//  UITextField+setLeftView.swift
//  IssueTracker
//
//  Created by cho on 2020/11/03.
//  Copyright © 2020 ralph. All rights reserved.
//

import Foundation
import UIKit
extension UITextField {
    func setLabel(_ text: String) {
        let label = UILabel(frame: CGRect(x: 30, y: 15, width: 10, height: 10))
        label.text = text
        label.font = UIFont(name: label.font.fontName, size: 12)
        label.textAlignment = .right
        label.widthAnchor.constraint(equalToConstant: 70).isActive = true
        leftView = label
        leftViewMode = .always
    }
}
