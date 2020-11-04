
import UIKit

class IssueListMainViewController: UIViewController {
    
    @IBOutlet weak var resultContrainerView: UIView!
    @IBOutlet weak var searchContrainerView: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var issueCreationButton: UIButton!
    
    var viewModel = IssueListViewModel()
    
    var searchViewController: SearchListViewController!
    var issueResultViewController: IssueResultViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchContrainerView.isHidden = true
        
        setupSearchListViewController()
        setupIssueResultViewController()
        
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(title: "Filter", style: .done, target: nil, action: #selector(pushFilterViewController))
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Edit", style: .done, target: nil, action: #selector(pushEditViewController))
        
        viewModel.status.searchResultList
            .bindAndFire(issueResultViewController.applySnapshot(sections:))
        viewModel.status.searchResultTitleList
            .bind(searchViewController.applySnapshot(sections:))
    }
    
    @IBAction func issueCreationButtonTabbed(_ sender: UIButton) {
        print("Add")
    }
    @objc func pushFilterViewController() {
        print("filter")
    }
    
    @objc func pushEditViewController() {
        print("Edit")
    }
    
    func setupSearchListViewController() {
        searchViewController = UIStoryboard(name: "IssueList", bundle: nil)
            .instantiateViewController(identifier: String(describing: SearchListViewController.self))
        searchContrainerView.addSubview(searchViewController.view)
    }
    
    func setupIssueResultViewController() {
        issueResultViewController = UIStoryboard(name: "IssueList", bundle: nil)
            .instantiateViewController(identifier: String(describing: IssueResultViewController.self))
        resultContrainerView.addSubview(issueResultViewController.view)
        issueResultViewController.collectionview.delegate = self
    }
    
}

extension IssueListMainViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchContrainerView.isHidden = false
        resultContrainerView.isHidden = true
        issueCreationButton.isHidden = true
        navigationController?.isNavigationBarHidden = true
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.action.searchButtonClicked(searchBar.text ?? "")
        searchBar.searchTextField.text = ""
        searchBar.resignFirstResponder()
        searchContrainerView.isHidden = true
        resultContrainerView.isHidden = false
        issueCreationButton.isHidden = false
        
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.isEnabled = true
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.action.searchTextChanged(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.searchTextField.text = ""
        searchContrainerView.isHidden = true
        resultContrainerView.isHidden = false
        issueCreationButton.isHidden = false
        navigationController?.isNavigationBarHidden = false
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        viewModel.action.searchCancelButtonClicked()
    }
    
}

extension IssueListMainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? IssueResultCellView else {
            return
        }
        //cell.iid 이걸 viewModel에 넘겨준다. viewModel이 생성하면서 서버와 통신하여 해당 iid의 이슈 데이터를 가져온다.
        
        let newVC = UIStoryboard(name: "IssueDetail", bundle: nil).instantiateViewController(identifier: String(describing: IssueDetailViewController.self))
        
        // 초기화
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.pushViewController(newVC, animated: true)
    }
}


#if DEBUG

import SwiftUI

struct IssueListMainViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "IssueList", bundle: nil)
            .instantiateViewController(identifier: String(describing: IssueListMainViewController.self))
        return vc.view.liveView
    }
}

#endif
