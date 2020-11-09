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
        collectionView.delegate = self
        navigationItem.rightBarButtonItem
            = UIBarButtonItem(
                image: UIImage(systemName: "plus"),
                style: .done,
                target: self, action: #selector(addLabelButtonTabbed))
        bind()
    }
    
    func bind() {
        viewModel.status.selectedLabel.bind(editLabel)
        viewModel.status.labels.bindAndFire(applyAnapshot)
    }
    
    func editLabel(label: Label) {
        let editVC = configureLabelEdiginVC()
        editVC.setupDefaultValue(title: label.name, desc: label.desc, color: label.color)
        present(editVC, animated: false)
    }
    
    @objc func addLabelButtonTabbed() {
        let editVC = configureLabelEdiginVC()
        present(editVC, animated: false)
    }
    
    func configureLabelEdiginVC() -> LabelEditingViewController {
        let editVC: LabelEditingViewController
            = UIStoryboard(name: "LabelList", bundle: nil)
            .instantiateViewController(identifier: String(describing: LabelEditingViewController.self))
        editVC.modalPresentationStyle = .overCurrentContext
        editVC.delegate = self
        return editVC
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
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 3, leading: 0, bottom: 1, trailing: 0)
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
        guard let cell: LabelListCellView = collectionView.cellForItem(at: indexPath) as? LabelListCellView else { return }
        viewModel.action.cellTouched(
            cell.labelTitle.titleLabel?.text ?? "",
            cell.labelDetail.text ?? "",
            cell.labelColor ?? "")
    }
}

extension LabelListViewController {
    enum Event {
        case finished
    }
}

#if DEBUG

import SwiftUI

struct LabelListViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "LabelList", bundle: nil)
            .instantiateViewController(identifier: String(describing: LabelListViewController.self))
        return vc.view.liveView
    }
}

#endif
