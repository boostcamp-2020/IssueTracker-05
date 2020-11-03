import UIKit

class SearchListViewController: UIViewController {
    
    typealias ResultType = String
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    var defaultModelData = ["abcdefg"] //TOOD: 나중에 삭제해야 한다.]
    lazy var dataLayout = makeDataLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.collectionViewLayout = createListLayout()
        applySnapshot(sections: defaultModelData)
    }
    
    func setup(models: [ResultType]) {
        
    }
    
    func applySnapshot(sections: [ResultType]) {
        var snapshot = NSDiffableDataSourceSnapshot<[ResultType], ResultType>()
        snapshot.appendSections([])
        snapshot.appendItems(sections)
        dataLayout.apply(snapshot, animatingDifferences: true)
    }
    
    func makeDataLayout() -> UICollectionViewDiffableDataSource<[ResultType], ResultType> {
        UICollectionViewDiffableDataSource<[ResultType], ResultType>(
            collectionView: collectionview,
            cellProvider: { (collectionView, indexPath, issueTitle) -> UICollectionViewCell? in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchListCellView", for: indexPath) as? SearchListCellView else {
                    return nil
                }
                
                cell.setup(title: issueTitle)
                
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
