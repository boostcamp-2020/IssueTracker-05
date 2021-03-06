//
//  IssueDetailEditingViewController.swift
//  IssueTracker
//
//  Created by 조정래 on 2020/11/04.
//  Copyright © 2020 ralph. All rights reserved.
//
import UIKit
import Alamofire

protocol IssueDetailEditingViewControllerDelegate {
    func scrollUpButtonTabbed()
    func scrollDownButtonTabbed()
    func addCommentButtonTabbed()
}

extension IssueDetailEditingViewController: SectionHeaderDelegate {
    func touchedEditButton(title: String) {
        if title == "레이블" {
//            let vc: LabelListViewController
//                = UIStoryboard(name: "LabelList", bundle: nil)
//                .instantiateViewController(
//                    identifier:String(describing: LabelListViewController.self))
//
//            navigationController?.modalPresentationStyle = .popover
//            navigationController?
//                .pushViewController(vc, animated: true)
            //present(vc, animated: true, completion: nil)
        } else if title == "마일스톤" {
//            let vc: LabelListViewController
//                = UIStoryboard(name: "MilestoneList", bundle: nil)
//                .instantiateViewController(
//                    identifier:String(describing: MilestoneListViewController.self))
//            present(vc, animated: true, completion: nil)
        }
    }
    
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
    
    weak var viewModel: IssueDetailViewModel?
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 80)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel?.status.model.value.assignees?.count ?? 0
        } else if section == 1 {
            return viewModel?.status.model.value.labels?.count ?? 0
        } else {
            return viewModel?.status.model.value.milestone?.mid == nil ? 0 : 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssigneeCollectionViewCell", for: indexPath) as! AssigneeCollectionViewCell
            if let assignee = viewModel?.status.model.value.assignees?[indexPath.row] {
                cell.tagButton.setTitle(assignee.userId, for: .normal)
                cell.tagButton.makeTagStyle()
            }
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCollectionViewCell", for: indexPath) as! LabelCollectionViewCell
            
            if let label = viewModel?.status.model.value.labels?[indexPath.row] {
                cell.tagButton.setTitle(label.name, for: .normal)
                cell.tagButton.makeTagStyle()
                cell.tagButton.backgroundColor = label.color.hexToColor()
            }
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MilestoneCollectionViewCell", for: indexPath) as! MilestoneCollectionViewCell
            cell.milestoneLabel.text = "\(String(describing: viewModel?.status.model.value.milestone?.title ?? ""))"
            
            if let total = viewModel?.status.model.value.milestone?.issues?.count {
                
                let complete:Double = viewModel?.status.model.value.milestone?.issues?.reduce(0.0) { (s1, s2) in
                    s1 + (s2.isOpen ? 0 : 1)
                } ?? 0
                
                cell.milestoneProgressView.progress = Float(complete / Double(total))
                cell.milestonePercentLabel.text = "\(Int(Float(complete / Double(total))*100))%"
            }
            
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader{
            if indexPath.section == 0 {
                sectionHeader.titleLabel.text = "담당자"
                sectionHeader.delegate = self
            } else if indexPath.section == 1 {
                sectionHeader.titleLabel.text = "레이블"
                sectionHeader.delegate = self
            } else {
                sectionHeader.titleLabel.text = "마일스톤"
                sectionHeader.delegate = self
            }
            return sectionHeader
        }
        return UICollectionReusableView()
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
