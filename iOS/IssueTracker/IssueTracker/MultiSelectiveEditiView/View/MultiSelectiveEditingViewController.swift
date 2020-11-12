import UIKit

class MultiSelectiveEditingViewController: UIViewController {
    
    var viewModel: MultiSelectiveEditingViewModel!
    
    @IBOutlet weak var resultContainerView: UIView!
    var resultViewController: IssueResultViewController!
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isHidden = false
        setupNavigationBarItem()
        setupTabBarButton()
        setupResultViewController()
        resultViewController.collectionview.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.status.issues
            .bindAndFire(resultViewController.applySnapshot(sections:))
        viewModel.status.title.bindAndFire(setSelectedNumberTitle)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    
    // MARK: Action
    
    func setSelectedNumberTitle(title: String) {
        navigationItem.title = title
    }
    
    @IBAction func closeSelectedIssues(_ sender: UIButton) {
        viewModel.action.closeSelectedIssues()
        navigationController?.popViewController(animated: false)
    }
    
    func setupTabBarButton() {
        tabBarController?.tabBar.isHidden = true
    }
    
    @objc func selectAllButtonTabbed() {
        let nowTitle = navigationItem.leftBarButtonItem?.title
        if nowTitle == "Select All" {
            navigationItem.leftBarButtonItem?.title = "Deselect All"
            navigationItem.leftBarButtonItem?.tintColor = .red
            viewModel.action.selectAll()
        } else {
            navigationItem.leftBarButtonItem?.title = "Select All"
            navigationItem.leftBarButtonItem?.tintColor = .systemBlue
            viewModel.action.deSelectAll()
        }
    }
    
    @objc func closeButtonTabbed() {
        navigationController?.popViewController(animated: false)
    }
    
    
    // MARK: Configure Views
    
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
    
}


// MARK: CollectionView Delegate

extension MultiSelectiveEditingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath)
                as? IssueResultCellView else { return }
        guard let id = cell.iid else { return }
        viewModel.action.cellTouched(id)
    }
    
}
