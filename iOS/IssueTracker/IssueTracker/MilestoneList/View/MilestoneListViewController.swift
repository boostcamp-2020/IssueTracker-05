import UIKit


class MilestoneListViewController: UIViewController {
    
    var didSendEventClosure: ((MilestoneListViewController.Event)-> Void)?
    lazy var dataLayout = makeDataLayout()
    var viewModel = MilestoneListViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout
            = configureCollectionViewLayout()
        bind()
    }
    
    func bind() {
        viewModel.status.milestones.bindAndFire(applyAnapshot)
    }
    
    func applyAnapshot(sections: [Milestone]) {
        var snapshot = NSDiffableDataSourceSnapshot<[Milestone], Milestone>()
        snapshot.appendSections([sections])
        snapshot.appendItems(sections)
        dataLayout.apply(snapshot, animatingDifferences: true)
    }
    
    func configureCollectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: itemSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func makeDataLayout() -> UICollectionViewDiffableDataSource<[Milestone],Milestone> {
        return UICollectionViewDiffableDataSource<[Milestone], Milestone>(
            collectionView: collectionView,
            cellProvider: { [weak self] collectionView, indexPath, milestone
                -> UICollectionViewCell? in
                guard let weakSelf = self else { return nil }
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MilestoneListViewCell", for: indexPath) as? MilestoneListViewCell else {
                    return nil
                }
                cell.setup(
                    title: milestone.title,
                    open: milestone.issues.open,
                    close: milestone.issues.close)
                return cell
            })
    }

}

extension MilestoneListViewController {
    enum Event {
        case finished
    }
}
