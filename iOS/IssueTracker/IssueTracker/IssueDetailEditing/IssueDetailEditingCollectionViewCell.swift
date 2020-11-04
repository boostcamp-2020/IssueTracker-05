//
//  IssueDetailEditingCollectionViewCell.swift
//  IssueTracker
//
//  Created by 조정래 on 2020/11/04.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

class IssueDetailEditingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var innerCollectionView: IssueDetailCollectionView!  {
        didSet {
            innerCollectionView.delegate = self
            innerCollectionView.dataSource = self
            innerCollectionView.reloadData()
        }
    }
    @IBOutlet var editButton: UIButton!

}

extension IssueDetailEditingCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: "innerCell"), for: indexPath) as! InnerCollectionViewCell
        cell.configureButton()
        self.innerCollectionView.layoutIfNeeded()
        return cell
    }
    
}

extension IssueDetailEditingCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width / 7, height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
