
import UIKit

class IssueListMainViewController: UIViewController {
    
    @IBOutlet weak var searchContrainerView: UIView!
    @IBOutlet weak var resultContrainerView: UIView!
    
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
        
        //TODO: filter랑 edit에 데이터 넘겨줄 때 viewModel 액션을 여기에 바인딩 해야함.
        // 데이터 넘겨주어야 하기 때문.
        // Filter, Edit 후 서버에 보내고 필터링, 에디팅 된 정보를 출력한다.
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(title: "Filter", style: .done, target: nil, action: #selector(pushFilterViewController))
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Edit", style: .done, target: nil, action: #selector(pushEditViewController))
        bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "이슈"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        self.tabBarController?.tabBar.isHidden = false
        self.issueCreationButton.bottomAnchor.constraint(equalTo: self.tabBarController!.tabBar.topAnchor).isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.layoutIfNeeded()
        //self.tabBarController?.tabBar.isHidden = true
    }
    
    
    func bind() {
        viewModel.status.searchResultList
            .bindAndFire(issueResultViewController.applySnapshot(sections:))
        viewModel.status.searchResultTitleList
            .bind(searchViewController.applySnapshot(sections:))
        issueResultViewController.closeIssueButtonTabbed
            = viewModel.action.closeButtonTabbed
        issueResultViewController.deleteIssueButtonTabbed
            = viewModel.action.deleteButtonTabbed
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
        let newVC = UIStoryboard(name: "IssueDetail", bundle: nil).instantiateViewController(identifier: String(describing: IssueDetailViewController.self)) as! IssueDetailViewController
        newVC.viewModel = IssueDetailViewModel(issueId: cell.iid ?? 0)
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.isNavigationBarHidden = false
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
