import UIKit


class Cell: Hashable {
    
    var id:String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        lhs.id == rhs.id
    }
    
}

enum Section {
    case main
}

class MilestoneListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var datasource: UICollectionViewDiffableDataSource<Section, MilestoneListModel>!
    
    let itemList = [MilestoneListModel(id: "1"), MilestoneListModel(id: "2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(MilestoneListViewCell.self, forCellWithReuseIdentifier: "MilestoneListViewCell")
        
        self.datasource = .init(collectionView: self.collectionView, cellProvider: { collectionView, indexPath, item -> UICollectionViewCell? in
                                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MilestoneListViewCell", for: indexPath) as! MilestoneListViewCell
                                    cell.id = "11"
                                    return cell })
    }
    
    
    func insertSomeThing() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MilestoneListViewCell>()
    }
    
    
}
