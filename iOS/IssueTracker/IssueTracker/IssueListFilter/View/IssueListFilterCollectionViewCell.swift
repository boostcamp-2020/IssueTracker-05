//
//  IssueListFilterCollectionViewCell.swift
//  IssueTracker
//
//  Created by 조정래 on 2020/11/11.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

class IssueListFilterCollectionViewCell: UICollectionViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var checkButton: UIButton!
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                checkButton.isSelected = true
            } else {
                checkButton.isSelected = false
            }
        }
    }
}
