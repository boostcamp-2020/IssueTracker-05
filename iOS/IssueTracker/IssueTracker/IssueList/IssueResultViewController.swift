import UIKit

class IssueResultViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    lazy var dataLayout = makeDataLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func applySnapshot(sections: [IssueListModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<[IssueListModel], IssueListModel>()
        
        //snapshot.appendSections(sections)
        
        snapshot.appendItems(sections)
        
//        sections.forEach { section in
//            //snapshot.appendItems(section, toSection: section)
//
//        }
        
        dataLayout.apply(snapshot, animatingDifferences: true)
    }
    
    func makeDataLayout() -> UICollectionViewDiffableDataSource<[IssueListModel], IssueListModel> {
        UICollectionViewDiffableDataSource<[IssueListModel], IssueListModel>(
            collectionView: collectionview,
            cellProvider: { [unowned self] (collectionView, indexPath, menu) -> UICollectionViewCell? in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IssueResultCellView", for: indexPath) as? IssueResultCellView else {
                    return nil
                }
                
                // TODO: cell update
                
                return cell
            })
    }
    
    func createListLayout() -> UICollectionViewLayout {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(100))
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
