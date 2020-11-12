import UIKit

class IssueResultViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    lazy var dataLayout = makeDataLayout()
    var cellType: IssueResultCellViewType?
    
    // MARK: Cell button Closure
    
    var closeIssueButtonTabbed: ((Int) -> Void)?
    var deleteIssueButtonTabbed: ((Int) -> Void)?
    
    
    // MARK: Refresh Closure
    var refreshData: (() -> Void)?
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.collectionViewLayout = createListLayout()
        collectionview.refreshControl = UIRefreshControl()
        collectionview.refreshControl?.attributedTitle = NSAttributedString(string: "새로고침")
        collectionview.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc func refresh() {
        refreshData?()
        self.collectionview.refreshControl?.endRefreshing()
    }
    
    
    // MARK: Configure CollectionView
    
    func applySnapshot(sections: [IssueListModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<[IssueListModel], IssueListModel>()
        snapshot.appendSections([sections])
        snapshot.appendItems(sections)
        dataLayout.apply(snapshot, animatingDifferences: true)
    }
    
    func makeDataLayout() -> UICollectionViewDiffableDataSource<[IssueListModel], IssueListModel> {
        UICollectionViewDiffableDataSource<[IssueListModel], IssueListModel>(
            collectionView: collectionview,
            cellProvider: { [weak self] (collectionView, indexPath, issue) -> UICollectionViewCell? in
                guard let weakSelf = self else { return nil }
                guard let cellType = weakSelf.cellType else { return nil }
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IssueResultCellView", for: indexPath) as? IssueResultCellView else {
                    return nil
                }
                cell.setup(
                    iid: issue.iid,
                    title: issue.title,
                    description: issue.content ?? "no",
                    type: cellType,
                    isChosen: issue.isSelected)
                cell.closeButtonAction = weakSelf.closeIssueButtonTabbed
                cell.deleteButtonAction = weakSelf.deleteIssueButtonTabbed
                return cell
            })
    }
    
    func createListLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 3, leading: 0, bottom: 0, trailing: 0)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: itemSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 5, bottom: 0, trailing: 5)
        return UICollectionViewCompositionalLayout(section: section)
    }
}


// MARK: Preview

#if DEBUG

import SwiftUI

struct IssueResultViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "IssueList", bundle: nil)
            .instantiateViewController(identifier: String(describing: IssueResultViewController.self))
        return vc.view.liveView
    }
}

#endif
