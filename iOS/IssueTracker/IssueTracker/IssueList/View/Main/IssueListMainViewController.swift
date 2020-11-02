
import UIKit

class IssueListMainViewController: UIViewController {
    
    @IBOutlet weak var resultContrainerView: UIView!
    @IBOutlet weak var searchContrainerView: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel = IssueListViewModel()
    var searchListViewModel = SearchListViewModel()
    
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
    
    @objc func pushFilterViewController() {
        print("filter")
    }
    
    @objc func pushEditViewController() {
        print("Edit")
    }
    
    let searchViewController: SearchListViewController = UIStoryboard(name: "IssueList", bundle: nil).instantiateViewController(identifier: String(describing: SearchListViewController.self))
    
    func setupSearchListViewController() {
        searchViewController.viewModel = searchListViewModel
        searchContrainerView.addSubview(searchViewController.view)
    }
    
    let issueResultViewController: IssueResultViewController = UIStoryboard(name: "IssueList", bundle: nil).instantiateViewController(identifier: String(describing: IssueResultViewController.self))
    
    func setupIssueResultViewController() {
        resultContrainerView.addSubview(issueResultViewController.view)
    }
    
}

extension IssueListMainViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchContrainerView.isHidden = false
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchContrainerView.isHidden = true
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
