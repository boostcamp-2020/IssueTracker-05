import UIKit

extension LabelListViewController: LabelEditingViewControllerDelegate {
    func labelEditSaveButtonDidTabbed(title: String, description: String, color: String) {
        viewModel.action.labelEditSaveButtonDidTabbed(title, description, color)
    }
}

class LabelListViewController: UIViewController {
    
    var didSendEventClosure: ((LabelListViewController.Event)-> Void)?
    
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var dataLayout = makeDataLayout()
    
    let dummy = Label.all()
    var viewModel = LabelListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = configureCollectionViewLayout()
        
        navigationItem.rightBarButtonItem
            = UIBarButtonItem(
                image: UIImage(systemName: "plus"),
                style: .done,
                target: self, action: #selector(createLabelButtonTabbed))
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func bind() {
        viewModel.status.labels.bindAndFire(applyAnapshot)
    }
    
    @objc func createLabelButtonTabbed() {
        print("createLabelButtonTabbed")
        
        let editVC: LabelEditingViewController
            = UIStoryboard(name: "LabelList", bundle: nil)
            .instantiateViewController(identifier: String(describing: LabelEditingViewController.self))
        editVC.modalPresentationStyle = .overCurrentContext
        editVC.delegate = self
        present(editVC, animated: false)
    }
    
    func applyAnapshot(sections: [Label]) {
        var snapshot = NSDiffableDataSourceSnapshot<[Label], Label>()
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
    
    func makeDataLayout() -> UICollectionViewDiffableDataSource<[Label],Label> {
        return UICollectionViewDiffableDataSource<[Label], Label>(
            collectionView: collectionView,
            cellProvider: { [weak self] collectionView, indexPath, label
                -> UICollectionViewCell? in
                guard let weakSelf = self else { return nil }
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelListCellView", for: indexPath) as? LabelListCellView else {
                    return nil
                }
                cell.setup(
                    title: label.name,
                    description: label.desc,
                    color: label.color)
                return cell
            })
    }
    
}

extension LabelListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension LabelListViewController {
    enum Event {
        case finished
    }
}
