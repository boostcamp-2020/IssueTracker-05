import UIKit
import RxSwift
import RxCocoa

class SearchListViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    var viewModel: SearchListViewModel!
    lazy var dataLayout = makeDataLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionview.collectionViewLayout = createListLayout()
        viewModel.status.model.bindAndFire(applySnapshot)
        
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
//            item.contentInsets = NSDirectionalEdgeInsets(
//                top: 0, leading: 5, bottom: 5, trailing: 5)
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: itemSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
//            section.contentInsets = NSDirectionalEdgeInsets(
//                top: 10, leading: 5, bottom: 10, trailing: 5)
            return UICollectionViewCompositionalLayout(section: section)
        }
}

#if DEBUG

import SwiftUI

struct SearchListViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: String(describing: SearchListViewController.self))
        return vc.view.liveView
    }
}

#endif
