
import UIKit

struct Contact: Hashable {
    let name: String
    let image: String
}

fileprivate typealias ContactDataSource  = UICollectionViewDiffableDataSource<IssueListFilterViewController.Section, Contact>
fileprivate typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<IssueListFilterViewController.Section, Contact>

class IssueListFilterViewController: UIViewController {
    
//    @IBOutlet weak var collectionView: UICollectionView!

    let cellId = "IssueListFilterCollectionViewCell"
    private var contacts = [Contact]()
    private var dataSource: ContactDataSource!
    private var collectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Diffable Data Source"
        
        createData()
        configureHierarchy()
        configureDataSource()
    }
}

//MARK: - Collection View Setup
extension IssueListFilterViewController {
    
    private func createData() {
          for i in 0..<10 {
              contacts.append(Contact(name:"Contact \(i)", image: ""))
          }
      }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 8, trailing: 16)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureHierarchy() {
         
         collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
         collectionView.delegate = self
         collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         collectionView.backgroundColor = .systemBackground
         collectionView.register(ContactCell.self, forCellWithReuseIdentifier: cellId)
         view.addSubview(collectionView)
     }
    
    private func configureDataSource() {
        
        dataSource = ContactDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, contact) -> ContactCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! ContactCell
            
            return cell
        })
        
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(self.contacts)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

//MARK: - Collection View Delegates
extension IssueListFilterViewController: UICollectionViewDelegate  {
    
    fileprivate enum Section {
        case main
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         collectionView.deselectItem(at: indexPath, animated: true)
         guard let contact = dataSource.itemIdentifier(for: indexPath) else { return }
        print(contact)
     }
    
}


extension UIView {
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
}


class ContactCell: UICollectionViewCell  {

    var contact: Contact? {
        didSet {
            nameLbl.text = contact?.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupCardCellShadow()
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var nameLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "Contact Name", size: 22)
        lbl.textColor = UIColor.init(white: 0.3, alpha: 0.4)
        return lbl
    }()
    
    
    lazy var contactImage: UIImageView = {
        let profileImg = UIImage(systemName: "person.crop.circle")
        let renderedImg = profileImg!.withTintColor(.gray, renderingMode: .alwaysOriginal)
        let imv = UIImageView(image: renderedImg )
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }()
    
    private func setupCell() {
    
        self.backgroundView?.addSubview(contactImage)
        self.backgroundView?.addSubview(nameLbl)

        NSLayoutConstraint.activate([
            contactImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contactImage.widthAnchor.constraint(equalToConstant: 50),
            contactImage.heightAnchor.constraint(equalToConstant: 50),

            nameLbl.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLbl.leadingAnchor.constraint(equalTo: contactImage.trailingAnchor, constant: 16),
            nameLbl.widthAnchor.constraint(equalToConstant: 150),
            nameLbl.heightAnchor.constraint(equalToConstant: 50),

        ])
        
    }
    
    override var isHighlighted: Bool {
        
        didSet{
            
            var transform = CGAffineTransform.identity
            if isHighlighted {
               transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
            
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: .curveEaseOut, animations: {
                self.transform = transform
            })
        }
    }
    
    func setupCardCellShadow() {
         backgroundView = UIView()
         addSubview(backgroundView!)
         backgroundView?.fillSuperview()
         backgroundView?.backgroundColor     = .white
         backgroundView?.layer.cornerRadius  = 26
         backgroundView?.layer.shadowOpacity = 0.1
         backgroundView?.layer.shadowOffset  = .init(width: 4, height: 10)
         backgroundView?.layer.shadowRadius  = 10

         layer.borderColor  = UIColor.gray.cgColor
         layer.borderWidth  = 0.2
         layer.cornerRadius = 26
         self.layoutIfNeeded()
     }
    
}
