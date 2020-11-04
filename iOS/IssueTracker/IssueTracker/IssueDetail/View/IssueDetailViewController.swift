
import UIKit

class IssueDetailViewController: UIViewController {
    
    var viewModel: IssueDetailViewModel?
    lazy var dataLayout = makeDataLayout()
    @IBOutlet weak var containerView: UIView!
    var swipeUpView: IssueDetailSwipeViewController!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        
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
                
                cell?.setup(title: comment.title, user: comment.user, content: comment.content)
                
                return cell
            })
    }
    
    func configureContainerOfSwipeView() {
        swipeUpView = UIStoryboard(name: "IssueDetail", bundle: nil)
            .instantiateViewController(identifier: String(describing: IssueDetailSwipeViewController.self)) as IssueDetailSwipeViewController
        containerView.addSubview(swipeUpView.view)
    }
    
    func configureNavigation() {
        
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
