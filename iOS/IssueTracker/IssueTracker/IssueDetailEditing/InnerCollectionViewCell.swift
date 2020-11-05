//
//  IssueDetailEditingInnerCollectionViewCell.swift
//  IssueTracker
//
//  Created by 조정래 on 2020/11/04.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

class InnerCollectionViewCell: UICollectionViewCell {

    func configureButton() {
        self.backgroundColor = .white
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setTitle("정래", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 5.0
        button.contentEdgeInsets.left = 5.0
        button.contentEdgeInsets.right = 5.0
        button.contentEdgeInsets.top = 5.0
        button.contentEdgeInsets.bottom = 5.0
        button.sizeToFit()
        
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        self.layoutIfNeeded()
    }
    
}
