
import UIKit

class IssueDetailViewController: UIViewController {
    
    var viewModel: IssueDetailViewModel?
    lazy var dataLayout = makeDataLayout()
    var swipeUpView: IssueDetailEditingViewController!
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var issueTitle: UILabel!
    @IBOutlet weak var issueNumber: UILabel!
    @IBOutlet weak var isOpenView: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    
    var isOpen = true  {// TODO: viewmodel에 바인딩 된 함수에서 바꿔준다.
        didSet {
            configureIsOpenView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureIsOpenView()
        configureContainerOfSwipeView()
        
        swipeUpView.view.layer.cornerRadius = 15

        if let viewModel = viewModel {
            viewModel.status.model.bindAndFire(updateViews(model:))
            return
        }
        // TODO: 나중에 제거해야 한다. 
        updateViews(model: IssueDetailModel.all())
    }
    
    func updateViews(model: IssueDetailModel) {
        // 여기서 업데이트 해야하는 것들
        // 유저 이미지 - 아직은 없음
        
        // 유저 이름
        //userName = model 이것도 아직은 없음
        
        // 이슈 타이틀
        issueTitle.text = model.title
        
        // 이슈 넘버
        issueNumber.text = "#\(model.iid)"
        // 오픈 클로즈 여부
        isOpen = model.isOpen
        
        // 댓글 목록 -> apply
        if let comments = model.comments {
            applySnapshot(sections: comments)
        } else {
            applySnapshot(sections: Comment.all())
        }
        
        //swipeUpView update -> 담당자, 마일스톤, 레이블
    }
    
    func applySnapshot(sections: [Comment]) {
        var snapshot = NSDiffableDataSourceSnapshot<[Comment], Comment>()
        snapshot.appendSections([sections])
        snapshot.appendItems(sections)
        dataLayout.apply(snapshot, animatingDifferences: true)
    }
    
    func makeDataLayout() -> UICollectionViewDiffableDataSource<[Comment], Comment> {
        UICollectionViewDiffableDataSource<[Comment], Comment>(
            collectionView: collectionView,
            cellProvider: { (collectionview, indexPath, comment) -> UICollectionViewCell? in
                let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "IssueCommentCellView", for: indexPath) as? IssueCommentCellView
                
                cell?.setup(
                    user: String(comment.uid),
                    content: comment.content,
                    time: comment.updatedAt)
                
                return cell
            })
    }
    
    func configureIsOpenView() {
        isOpenView.setImage(
            UIImage(systemName: "exclamationmark.circle"),
            for: .normal)
        let title = isOpen ? "open" : "closed"
        isOpenView.setTitle(title, for: .normal)
        isOpenView.backgroundColor = isOpen ? .systemGreen : .systemPink
        isOpenView.tintColor = isOpen ? .white : .white
        isOpenView.contentEdgeInsets = UIEdgeInsets(top: 1, left: 7, bottom: 1, right: 7)
    }
    
    func configureContainerOfSwipeView() {
        swipeUpView = UIStoryboard(name: "IssueDetailEditing", bundle: nil)
            .instantiateViewController(identifier: String(describing:IssueDetailEditingViewController.self))
        containerView.addSubview(swipeUpView.view)
        configureAnimation()
    }
    
    var swipeGesture: UISwipeGestureRecognizer!
    var oldY: CGFloat!
    var newY: CGFloat!
    
    func configureAnimation() {
        oldY = containerView.frame.origin.y
        newY = view.frame.height - containerView.frame.height
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(upperGesture))
        swipeGesture.direction = .up
        containerView.addGestureRecognizer(swipeGesture)
    }
    
    @objc func upperGesture(_ sender: Any) {
        UIView.transition(
            with: containerView,
            duration: 0.5,
            options: .curveEaseIn,
            animations: { [weak self] in
                guard let weakSelf = self else { return }
                let rect = CGRect(
                    x: weakSelf.containerView.frame.origin.x,
                    y: weakSelf.swipeGesture.direction == .up ? weakSelf.newY : weakSelf.oldY,
                    width: weakSelf.containerView.frame.width,
                    height: weakSelf.containerView.frame.height)
                weakSelf.containerView.frame = rect
                weakSelf.swipeGesture.direction
                    = weakSelf.swipeGesture.direction == .up ? .down : .up
                weakSelf.swipeUpView.collectionView.isScrollEnabled.toggle()
            })
    }
    
    func configureNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.topItem?.title = ""
        self.tabBarController?.tabBar.isHidden = true
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "Edit", style: .done, target: nil, action: #selector(pushEditViewController))
    }
    
    @objc func pushEditViewController() {
        print("Edit")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

#if DEBUG

import SwiftUI

struct IssueDetailViewController_Preview: PreviewProvider {
    static var previews: some View {
        let vc = UIStoryboard(name: "IssueDetail", bundle: nil)
            .instantiateViewController(identifier: String(describing: IssueDetailViewController.self))
        return vc.view.liveView
    }
}

#endif
