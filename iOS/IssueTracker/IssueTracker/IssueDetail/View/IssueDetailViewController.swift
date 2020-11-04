
import UIKit

class IssueDetailViewController: UIViewController {
    
    var viewModel: IssueDetailViewModel?
    lazy var dataLayout = makeDataLayout()
    @IBOutlet weak var containerView: UIView!
    var swipeUpView: IssueDetailEditingViewController!
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
        swipeUpView = UIStoryboard(name: "IssueDetailEditing", bundle: nil)
            .instantiateViewController(identifier: "IssueDetailEditingVC") as! IssueDetailEditingViewController
        containerView.addSubview(swipeUpView.view)
        configureAnimation()
        
    }
    
    var swipeGesture: UISwipeGestureRecognizer!
    var oldY: CGFloat!
    var newY: CGFloat!
    
    func configureAnimation() {
        oldY = containerView.frame.origin.y
        newY = view.frame.height - containerView.frame.height
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(upperGesture))
        swipeGesture.direction = .up
        containerView.addGestureRecognizer(swipeGesture)
    }
    
    @objc func upperGesture(_ sender: Any) {
        UIView.transition(
            with: containerView,
            duration: 0.5,
            options: .curveEaseIn,
            animations: { [weak self] in
                guard let weakSelf = self else { return }
                let rect = CGRect(
                    x: weakSelf.containerView.frame.origin.x,
                    y: weakSelf.swipeGesture.direction == .up ? weakSelf.newY : weakSelf.oldY,
                    width: weakSelf.containerView.frame.width,
                    height: weakSelf.containerView.frame.height)
                
                weakSelf.containerView.frame = rect
                
                weakSelf.swipeGesture.direction
                    = weakSelf.swipeGesture.direction == .up ? .down : .up
                
                weakSelf.swipeUpView.collectionView.isScrollEnabled.toggle()
                
            })
    }
    
    func configureNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.topItem?.title = ""
        self.tabBarController?.tabBar.isHidden = true
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
