import UIKit

class IssueResultViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    lazy var dataLayout = makeDataLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.collectionViewLayout = createListLayout()
        applySnapshot(sections: IssueListModel.all())
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
            cellProvider: { (collectionView, indexPath, issue) -> UICollectionViewCell? in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IssueResultCellView", for: indexPath) as? IssueResultCellView else {
                    return nil
                }
                
                cell.setup(title: issue.title, description: issue.content ?? "no")
                cell.closeButtonAction = {
                    print("여기서 close합니다.") // TODO: 클로저로 Main에서 ViewModel 함수를 넣어준다. 
                }
                cell.deleteButtonAction = {
                    print("여기서 delete합니다.")
                }
                
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
