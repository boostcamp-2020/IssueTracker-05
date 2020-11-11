import UIKit

// 선택 이슈 닫기 누르면 선택된 데이터들 이전 vc(이슈 리스트)로 넘겨준다.
// 이를 위해 델리게이트를 만들고, 종료 될 때 호출 한다.
// 이슈리스트는 델리게이트를 호출하여 원하는 정보를 받아 간다.
// -> 근데 그냥 서버 요청하면 끝날 것 같다!

class MultiSelectiveEditingViewController: UIViewController {
    
    var selectedIssues: [IssueListModel]?
    
    var viewModel: MultiSelectiveEditingViewModel!
    
    @IBOutlet weak var resultContainerView: UIView!
    var resultViewController: IssueResultViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 타이틀에 선택 개수가 나오도록 해야 한다.
        
        setupNavigationBarItem()
        setupTabBarButton()
        setupResultViewController()
        resultViewController.collectionview.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.status.issues
            .bindAndFire(resultViewController.applySnapshot(sections:))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func closeSelectedIssues(_ sender: UIButton) {
        viewModel.action.closeSelectedIssues()
        navigationController?.popViewController(animated: false)
    }
    
    func setupResultViewController() {
        resultViewController = UIStoryboard(name: "IssueList", bundle: nil)
            .instantiateViewController(
                identifier: String(describing: IssueResultViewController.self))
        
        resultViewController.view.frame = resultContainerView.bounds
        resultContainerView.addSubview(resultViewController.view)
        
        resultViewController.cellType = .MultiSelectedView
    }
    
    func setupNavigationBarItem() {
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(title: "Select All", style: .done, target: self, action: #selector(selectAllButtonTabbed))
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(closeButtonTabbed))
    }
    
    func setupTabBarButton() {
        tabBarController?.tabBar.isHidden = true
    }
    
    
    @objc func selectAllButtonTabbed() {
        //collectionView
        // 콜렉션 뷰를 모두 돌면서 버튼 이미지를 모두 true로?
    }
    
    @objc func closeButtonTabbed() {
        navigationController?.popViewController(animated: false)
    }
    
}

extension MultiSelectiveEditingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath)
                as? IssueResultCellView else { return }
        guard let id = cell.iid else { return }
        cell.toggleCheckButton()
        viewModel.action.cellTouched(id)
    }
}
