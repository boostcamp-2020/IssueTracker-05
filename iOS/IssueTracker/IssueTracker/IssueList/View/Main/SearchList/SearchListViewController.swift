import UIKit

class SearchListViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    var defaultModelData = IssueListModel.all() //TOOD: 나중에 삭제해야 한다.
    var viewModel: SearchListViewModel!
    lazy var dataLayout = makeDataLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.collectionViewLayout = createListLayout()
        applySnapshot(sections: defaultModelData)
    }
    
    func setup(viewModel: SearchListViewModel) {
        self.viewModel = viewModel
        viewModel.status.model.bindAndFire(applySnapshot(sections:))
    }
    
    func applySnapshot(sections: [IssueListModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<[IssueListModel], IssueListModel>()
        snapshot.appendSections([sections])
        snapshot.appendItems(sections)
        dataLayout.apply(snapshot, animatingDifferences: true)
    }
    
    func makeDataLayout() -> UICollectionViewDiffableDataSource<[IssueListModel], IssueListModel> {
        UICollectionViewDiffableDataSource<[IssueListModel], IssueListModel>(
            collectionView: collectionview,
            cellProvider: { [unowned self] (collectionView, indexPath, issue) -> UICollectionViewCell? in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchListCellView", for: indexPath) as? SearchListCellView else {
                    return nil
                }
                
                cell.setup(title: issue.title)
                
                return cell
            })
    }
    
    func createListLayout() -> UICollectionViewLayout {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(30))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: itemSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 3, leading: 20, bottom: 0, trailing: 20)
            return UICollectionViewCompositionalLayout(section: section)
        }
}

#if DEBUG

import SwiftUI

struct SearchListViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "IssueList", bundle: nil)
            .instantiateViewController(identifier: String(describing: SearchListViewController.self))
        
        return vc.view.liveView
    }
}

#endif
