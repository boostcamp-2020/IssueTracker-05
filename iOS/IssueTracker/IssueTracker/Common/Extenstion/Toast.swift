//
//  showToast.swift
//  IssueTracker
//
//  Created by cho on 2020/11/12.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

class Toast {
    
    static let shared = Toast()
 
    private init() {
    }
    
    func showToast(message : String, view: UIView) {
        let width_variable:CGFloat = 100
        let toastLabel = UILabel(frame: CGRect(x: width_variable, y: view.frame.size.height-100, width: view.frame.size.width-2*width_variable, height: 35))
        // 뷰가 위치할 위치를 지정해준다. 여기서는 아래로부터 100만큼 떨어져있고, 너비는 양쪽에 10만큼 여백을 가지며, 높이는 35로
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        UIApplication.shared.keyWindow?.addSubview(toastLabel)
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
