//
//  IssueDetailEditingViewController.swift
//  IssueTracker
//
//  Created by 조정래 on 2020/11/04.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

class IssueDetailEditingViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
        
    }
    
    func configure() {
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
    }
    
}

extension IssueDetailEditingViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        let estimatedHeight: CGFloat = 300.0
        let dummyCell = IssueDetailEditingCollectionViewCell(frame: CGRect(x:0, y:0, width: width, height: estimatedHeight))
        dummyCell.layoutIfNeeded()
        let estimatedSize = dummyCell.systemLayoutSizeFitting(
            CGSize(width: width, height: estimatedHeight))
        return CGSize(width: width, height: estimatedSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IssueDetailEditingCell", for: indexPath) as! IssueDetailEditingCollectionViewCell
        
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "담당자"
        case 1:
            cell.titleLabel.text = "레이블"
        case 2:
            cell.titleLabel.text = "마일스톤"
        default: break
        }
        
        cell.backgroundColor = .systemBackground
        cell.layoutIfNeeded()
        return cell
    }
    
}

extension IssueDetailEditingViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: self.view.bounds.width, height: 128)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2.0
    }
    
}
