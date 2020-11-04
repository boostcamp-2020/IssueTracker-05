
import UIKit

class IssueDetailViewController: UIViewController {
    
    var viewModel: IssueDetailViewModel?
    lazy var dataLayout = makeDataLayout()
    @IBOutlet weak var containerView: UIView!
    var swipeUpView: IssueDetailSwipeViewController!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var isOpenView: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureIsOpenView()
        viewModel = IssueDetailViewModel(model: Comment.all())
        configureContainerOfSwipeView()
        viewModel?.status.model.bindAndFire(applySnapshot(sections:))
    }
    
    func applySnapshot(sections: [Comment]) {
        var snapshot = NSDiffableDataSourceSnapshot<[Comment], Comment>()
        snapshot.appendSections([sections])
        snapshot.appendItems(sections)
        dataLayout.apply(snapshot, animatingDifferences: true)
    }
    
    func makeDataLayout() -> UICollectionViewDiffableDataSource<[Comment], Comment> {
        UICollectionViewDiffableDataSource<[Comment], Comment>(
            collectionView: collectionView,
            cellProvider: { (collectionview, indexPath, comment) -> UICollectionViewCell? in
                let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "IssueCommentCellView", for: indexPath) as? IssueCommentCellView
                
                cell?.setup(user: comment.user, content: comment.content)
                
                return cell
            })
    }
    
    func configureIsOpenView() {
        let isOpen = true // TODO: viewmodel에 바인딩 된 함수에서 바꿔준다.
        isOpenView.setImage(
            UIImage(systemName: "exclamationmark.circle"),
            for: .normal)
        let title = isOpen ? "open" : "closed"
        isOpenView.setTitle(title, for: .normal)
        isOpenView.backgroundColor = isOpen ? .systemGreen : .systemPink
        isOpenView.tintColor = isOpen ? .white : .white
        isOpenView.contentEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
    }
    
    func configureContainerOfSwipeView() {
        swipeUpView = UIStoryboard(name: "IssueDetail", bundle: nil)
            .instantiateViewController(identifier: String(describing: IssueDetailSwipeViewController.self)) as IssueDetailSwipeViewController
        containerView.addSubview(swipeUpView.view)
        
        // IssueDetailEditingVC
        // IssueDetailEditingViewController
    }
    
    func configureNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Edit", style: .done, target: nil, action: #selector(pushEditViewController))
    }
    
    @objc func pushEditViewController() {
        print("Edit")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

#if DEBUG

import SwiftUI

struct IssueDetailViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "IssueDetail", bundle: nil)
            .instantiateViewController(identifier: String(describing: IssueDetailViewController.self))
        return vc.view.liveView
    }
}

#endif
