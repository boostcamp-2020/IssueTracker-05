import UIKit

// 선택 이슈 닫기 누르면 선택된 데이터들 이전 vc(이슈 리스트)로 넘겨준다.
// 이를 위해 델리게이트를 만들고, 종료 될 때 호출 한다.
// 이슈리스트는 델리게이트를 호출하여 원하는 정보를 받아 간다.

protocol MultiSelectiveEditingDelegate {
    func closeSelectedIssuesButtonTabbed(selectedIssues: [IssueListModel])
}

class MultiSelectiveEditing: UIViewController {
    
    var delegate: MultiSelectiveEditingDelegate?
    var selectedIssues: [IssueListModel]?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItem()
        // 탭바에도 연결 시키기
    }
    
    func setupNavigationBarItem() {
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(title: "Select All", style: .done, target: self, action: #selector(selectAllButtonTabbed))
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(closeButtonTabbed))
    }
    
    
    @objc func selectAllButtonTabbed() {
        
    }
    
    @objc func closeButtonTabbed() {
        
    }
    
    // 탭바에 들어가는 버튼
    @objc func selectedIssuesCloseButtonTabbed() {
        delegate?.closeSelectedIssuesButtonTabbed(selectedIssues: <#T##[IssueListModel]#>)
    }
}
