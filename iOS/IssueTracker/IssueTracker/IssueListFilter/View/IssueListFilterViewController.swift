import UIKit

typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>

class IssueListFilterViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var dataSource = makeDataSource()
    private var sections = Section.allSections
    
    var viewModel: IssueListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewLayout()
        applySnapshot(animatingDifferences: false)
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true
        isModalInPresentation = true
    }
    
    func makeDataSource() -> DataSource {
        
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, item) ->
                UICollectionViewCell? in
                
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "IssueListFilterCollectionViewCell",
                    for: indexPath) as! IssueListFilterCollectionViewCell
                cell.titleLabel.text = item.name
                
                NSLayoutConstraint.activate([
                    cell.titleLabel.leadingAnchor.constraint(
                        equalTo: cell.readableContentGuide.leadingAnchor),
                    cell.titleLabel.trailingAnchor.constraint(
                        lessThanOrEqualTo: cell.readableContentGuide.trailingAnchor)
                ])
                
                NSLayoutConstraint.activate([
                    cell.titleLabel.topAnchor.constraint(
                        equalTo: cell.topAnchor,
                        constant: 10),
                    cell.titleLabel.bottomAnchor.constraint(
                        equalTo: cell.bottomAnchor,
                        constant: -10)
                ])
                
                if indexPath.section == 1 {
                    cell.checkButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
                    cell.isUserInteractionEnabled = false
                }
                
                return cell
            })
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            
            guard kind == UICollectionView.elementKindSectionHeader else {
                return nil
            }
            
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier,
                for: indexPath) as? SectionHeaderReusableView
            
            let section = self.dataSource.snapshot()
                .sectionIdentifiers[indexPath.section]
            view?.titleLabel.text = section.title
            
            return view
        }
        
        return dataSource
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        sections.forEach { section in
            snapshot.appendItems(section.items, toSection: section)
        }
        
        // 5
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    func configureCollectionViewLayout() {
        
        collectionView.register(
            SectionHeaderReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier
        )
        
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let size = NSCollectionLayoutSize(
                widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
                heightDimension: NSCollectionLayoutDimension.estimated(2)
            )
            let itemCount = 1
            let item = NSCollectionLayoutItem(layoutSize: size)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: itemCount)
            let section = NSCollectionLayoutSection(group: group)
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            section.interGroupSpacing = 1
            
            // Supplementary header view setup
            let headerFooterSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(10)
            )
            
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerFooterSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            section.boundarySupplementaryItems = [sectionHeader]
            return section
        })
    }
    
    @IBAction func cancelButtonTabbed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func doneButtonTabbed(_ sender: Any) {
        
        let indexPath = collectionView.indexPathsForSelectedItems?.map {
            Int($0.last!)
        }
        
        viewModel?.action.issueFilter(indexPath!)
        
        self.dismiss(animated: true)
    }
    
}

extension IssueListFilterViewController: UICollectionViewDelegate {
    func collectionView(
      _ collectionView: UICollectionView,
      didSelectItemAt indexPath: IndexPath
    ) {
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}
