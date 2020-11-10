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
            heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 3, leading: 0, bottom: 0, trailing: 0)
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
                cell.setup(with: milestone)
                return cell
            })
    }

}

extension MilestoneListViewController {
    enum Event {
        case finished
    }
}


#if DEBUG

import SwiftUI

struct MilestoneListViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "MilestoneList", bundle: nil)
            .instantiateViewController(identifier: String(describing: MilestoneListViewController.self))
        return vc.view.liveView
    }
}

#endif
