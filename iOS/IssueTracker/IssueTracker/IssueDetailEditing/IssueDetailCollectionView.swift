//
//  IssueDetailCollectionView.swift
//  IssueTracker
//
//  Created by 조정래 on 2020/11/04.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

class TokenCollViewFlowLayout: UICollectionViewFlowLayout {
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
    var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()
    
    var leftMargin: CGFloat = self.sectionInset.left
    
    for attributes in attributesForElementsInRect! {
      if (attributes.frame.origin.x == self.sectionInset.left) {
        leftMargin = self.sectionInset.left
      } else {
        var newLeftAlignedFrame = attributes.frame
        
        if leftMargin + attributes.frame.width < self.collectionViewContentSize.width {
          newLeftAlignedFrame.origin.x = leftMargin
        } else {
          newLeftAlignedFrame.origin.x = self.sectionInset.left
        }
        
        attributes.frame = newLeftAlignedFrame
      }
      leftMargin += attributes.frame.size.width + 8
      newAttributesForElementsInRect.append(attributes)
    }
    
    return newAttributesForElementsInRect
  }
}

class IssueDetailCollectionView: UICollectionView {

    var isDynamicSizeRequired =  false
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        backgroundColor = .tertiarySystemBackground
        isScrollEnabled = false
        registerCollectionViewCell()
    }
    
    private func registerCollectionViewCell() {
        let nib = UINib(nibName: String(describing: "InnerCell"), bundle: nil)
        register(nib, forCellWithReuseIdentifier: String(describing: "InnerCell"))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
          
          if self.intrinsicContentSize.height > frame.size.height {
            self.invalidateIntrinsicContentSize()
          }
          if isDynamicSizeRequired {
            self.invalidateIntrinsicContentSize()
          }
        }
    }
    
    override var intrinsicContentSize: CGSize {
      return contentSize
    }
    
}
