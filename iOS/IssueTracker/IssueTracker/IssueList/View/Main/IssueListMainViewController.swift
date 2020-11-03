
import UIKit

class IssueListMainViewController: UIViewController {
    
    @IBOutlet weak var resultContrainerView: UIView!
    @IBOutlet weak var searchContrainerView: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var issueCreationButton: UIButton!
    
    var viewModel = IssueListViewModel()
    lazy var searchListViewModel = SearchListViewModel(originModel: self.viewModel.status.model.value)
    // TODO: viewmodel에 있는 값이 네트워크로부터 받아온 데이터로 변경되면
    // searchListViewModel에 있는 origin도 바꾸어 줘야 한다.
    // 이 작업을 해주는 함수를 바인딩 해두자
    
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
    
    let searchViewController: SearchListViewController = UIStoryboard(name: "IssueList", bundle: nil).instantiateViewController(identifier: String(describing: SearchListViewController.self))
    
    func setupSearchListViewController() {
        searchContrainerView.addSubview(searchViewController.view)
    }
    
    let issueResultViewController: IssueResultViewController = UIStoryboard(name: "IssueList", bundle: nil).instantiateViewController(identifier: String(describing: IssueResultViewController.self))
    
    func setupIssueResultViewController() {
        resultContrainerView.addSubview(issueResultViewController.view)
        issueResultViewController.setupModel(
            models: viewModel.status.model.value)
    }
    
}

extension IssueListMainViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchContrainerView.isHidden = false
        searchViewController.setup(viewModel: searchListViewModel)
        resultContrainerView.isHidden = true
        issueCreationButton.isHidden = true
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchContrainerView.isHidden = true
        resultContrainerView.isHidden = false
        issueCreationButton.isHidden = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchListViewModel.action.searchTextChanged(searchText)
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
