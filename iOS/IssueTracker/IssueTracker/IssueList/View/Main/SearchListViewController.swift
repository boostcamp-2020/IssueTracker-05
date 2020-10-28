import UIKit

class SearchListViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    var sections = [IssueListModel]()
    lazy var dataLayout = makeDataLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionview.collectionViewLayout = createListLayout()
        
        sections.append(IssueListModel(isOpened: true, label: ["feature"], title: "레이블 목록 보기 구현", content: "레이블 전체 목록을 볼 수 있어야 한다\n 2줄까지 보입니다.", mId: "1", id: "1"))
        sections.append(IssueListModel(isOpened: true, label: ["bug"], title: "마일스톤 목록 보기 구현", content: "레이블 전체 목록을 볼 수 있어야 한다\n 2줄까지 보입니다.", mId: "1", id: "1"))
    
        applySnapshot(sections: sections)
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
