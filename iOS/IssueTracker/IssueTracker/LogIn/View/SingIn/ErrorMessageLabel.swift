//
//  ErrorMessageLabel.swift
//  IssueTracker
//
//  Created by cho on 2020/11/02.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

extension UILabel{
        
    func update(message:String?) {
        guard let errorMessage = message else { self.isHidden = false; return }
        self.text = errorMessage
        self.isHidden = true
    }
    
}
