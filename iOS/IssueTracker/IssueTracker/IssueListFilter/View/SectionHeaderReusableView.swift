//
//  SectionHeaderReusableView.swift
//  IssueTracker
//
//  Created by 조정래 on 2020/11/11.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

// 1
class SectionHeaderReusableView: UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: SectionHeaderReusableView.self)
    }
    
    // 2
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(
            ofSize: UIFont.preferredFont(forTextStyle: .caption1).pointSize,
            weight: .semibold)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.setContentCompressionResistancePriority(
            .defaultHigh,
            for: .horizontal)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: readableContentGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: readableContentGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 20),
            titleLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
