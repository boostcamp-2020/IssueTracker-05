import UIKit

enum Section {
    case main
}

class MilestoneListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - Value Types
    typealias DataSource = UICollectionViewDiffableDataSource<Section, MilestoneListModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, MilestoneListModel>
    
    private lazy var dataSource = makeDataSource()
    
    let itemList = [MilestoneListModel(id: "1"), MilestoneListModel(id: "2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func makeDataSource() -> DataSource {
        // 1
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, item) ->
                UICollectionViewCell? in
                // 2
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "MilestoneListViewCell",
                    for: indexPath) as? MilestoneListViewCell
                
                return cell
            })
        return dataSource
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        // 2
        var snapshot = Snapshot()
        // 3
        snapshot.appendSections([.main])
        // 4
        snapshot.appendItems(itemList, toSection: .main)
        // 5
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    
}
