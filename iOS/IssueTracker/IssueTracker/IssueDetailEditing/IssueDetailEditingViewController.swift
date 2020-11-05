//
//  IssueDetailEditingViewController.swift
//  IssueTracker
//
//  Created by 조정래 on 2020/11/04.
//  Copyright © 2020 ralph. All rights reserved.
//
import UIKit

protocol IssueDetailEditingViewControllerDelegate {
    func scrollUpButtonTabbed()
    func scrollDownButtonTabbed()
    func addCommentButtonTabbed()
}

class IssueDetailEditingViewController: UIViewController {
    
    //@IBOutlet weak var buttonForInit:
    
    var delegate: IssueDetailEditingViewControllerDelegate?
    
    @IBOutlet var buttonsForInit: [UIButton]!
    
    @IBOutlet var collectionView: IssueDetailCollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
        collectionView.isScrollEnabled = false
        buttonsForInit.forEach {
            $0.configureButtonInDetailEditing()
        }
    }
    
    func configure() {
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
        self.collectionView.isDynamicSizeRequired = true
    }
    
    @IBAction func addCommentButtonTabbed(_ sender: UIButton) {
        delegate?.addCommentButtonTabbed()
    }
    
    @IBAction func scrollUpButtonTabbed(_ sender: UIButton) {
        delegate?.scrollUpButtonTabbed()
    }
    
    @IBAction func scrollDownButtonTabbed(_ sender: UIButton) {
        delegate?.scrollDownButtonTabbed()
    }
    
}

extension IssueDetailEditingViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        let estimatedHeight: CGFloat = 100.0
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
        self.collectionView.collectionViewLayout.invalidateLayout()
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


#if DEBUG

import SwiftUI

struct IssueDetailEditingViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "IssueDetailEditing", bundle: nil)
            .instantiateViewController(identifier: String(describing: IssueDetailEditingViewController.self))
        return vc.view.liveView
    }
}

#endif
