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
    
    var delegate: IssueDetailEditingViewControllerDelegate?
    
    @IBOutlet var buttonsForInit: [UIButton]!
    
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
        collectionView.isScrollEnabled = false
        buttonsForInit.forEach {
            $0.configureButtonInDetailEditing()
        }
        
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

extension IssueDetailEditingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 400, height: 100)
    }
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var cell = UICollectionViewCell()

        if indexPath.section == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssigneeCollectionViewCell", for: indexPath) as! AssigneeCollectionViewCell
        } else if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCollectionViewCell", for: indexPath) as! LabelCollectionViewCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MilestoneCollectionViewCell", for: indexPath) as! MilestoneCollectionViewCell
        }
        
        return cell
    }
     
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader{
            if indexPath.section == 0 {
                sectionHeader.titleLabel.text = "담당자"
            } else if indexPath.section == 1 {
                sectionHeader.titleLabel.text = "레이블"
            } else {
                sectionHeader.titleLabel.text = "마일스톤"
            }
            return sectionHeader
        }
        return UICollectionReusableView()
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
