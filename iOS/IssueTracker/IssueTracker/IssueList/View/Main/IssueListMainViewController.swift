
import UIKit
import RxSwift
import RxCocoa

class IssueListMainViewController: UIViewController {
    
    @IBOutlet weak var resultContrainerView: UIView!
    @IBOutlet weak var searchContrainerView: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel = IssueListViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchContrainerView.isHidden = true
        
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
        
        setupSearchListViewController()
        setupIssueResultViewController()
    }
    
    let searchViewController: SearchListViewController = UIStoryboard(name: "IssueList", bundle: nil).instantiateViewController(identifier: String(describing: SearchListViewController.self))
    
    func setupSearchListViewController() {
        searchViewController.viewModel = viewModel
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { // 엔터 치면 작동
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchContrainerView.isHidden = true
    }
    
}

#if DEBUG

import SwiftUI

struct IssueListMainViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: String(describing: IssueListMainViewController.self))
        return vc.view.liveView
    }
}

#endif
