
import Foundation

class IssueListViewModel {
    
    lazy var service = IssueListService(viewModel: self)
    
    struct Status {
        var issues =  Bindable(IssueListModel.all())
        var searchResultTitleList = Bindable([String]())
        var searchResultList = Bindable(IssueListModel.all())
        var filterResult = Bindable(IssueListModel.all())
    }
    
    struct Action {
        var searchTextChanged: (String) -> Void
        var searchButtonClicked: (String) -> Void
        var searchCancelButtonClicked: () -> Void
        var closeButtonTabbed: (Int) -> Void
        var deleteButtonTabbed: (Int) -> Void
        
        // 다중 선택
      
        var refreshData: () -> Void
        var addIssueTabbed: (Int?, String, String) -> Void
        var issueFilter: ([Int]) -> Void
    }
    
    var status = Status()
    lazy var action = Action(
        searchTextChanged: { [weak self] (newText) -> Void in
            guard let weakSelf = self else { return }
            weakSelf.status.searchResultTitleList.value
                = weakSelf.status.issues.value.filter {
                    $0.title.contains(newText)
                }.reduce([String()], { (uniqueTitleList, issueListModel) in
                    if !uniqueTitleList.contains(issueListModel.title) {
                        return uniqueTitleList + [issueListModel.title]
                    }
                    return uniqueTitleList
                })
        },searchButtonClicked: { [weak self] searchBarText in
            guard let weakSelf = self else { return }
            weakSelf.status.searchResultList.value
                = weakSelf.status.issues.value.filter {
                    $0.title.contains(searchBarText)
                }
        },searchCancelButtonClicked: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.status.searchResultList.value
                = weakSelf.status.issues.value
            weakSelf.service.requestIssueListGet()
        }, closeButtonTabbed: { [weak self] iid in
            guard let weakSelf = self else { return }
            weakSelf.service.requestIssueClose(issueId: iid)
        }, deleteButtonTabbed: { [weak self] iid in
            guard let weakSelf = self else { return }
            weakSelf.service.requestIssueDelete(issueId: iid)
            for index in weakSelf.status.issues.value.indices {
                if weakSelf.status.issues.value[index].iid == iid {
                    weakSelf.status.issues.value.remove(at: index)
                   return
                }
            }
        }, refreshData: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.service.requestIssueListGet()
        }, addIssueTabbed: { [weak self] iid, title, content in
            guard let weakSelf = self else { return }
            if let id = iid {
                weakSelf.service.requestEditIssue(issueId: id, title: title, content: content)
                print(id)
            } else {
                weakSelf.service.requestAddIssue(title: title, content: content)
            }
        }, issueFilter: { [weak self] conditions in
            guard let weakSelf = self else { return }
            
            var filterIssue = weakSelf.status.issues.value
            
            print(filterIssue)
            
            conditions.forEach { condition in
                switch condition {
                //열린 이슈들
                case 0:
                    filterIssue = filterIssue.filter {
                        $0.isOpen == true
                    }
                //내가 작성한 이슈들
                case 1:
                    filterIssue = filterIssue.filter {
                        return ($0.user.uid == Int(UserDefaults.standard.string(forKey: "uid") ?? ""))
                    }
                //나한테 할당된 이슈들
                case 2:
                    filterIssue = filterIssue.filter { list in
                        var isAssign = false
                        list.assignees?.forEach { assignee in
                            if assignee.userId == UserDefaults.standard.string(forKey: "uid") {
                                isAssign = true
                            }
                        }
                        return isAssign
                    }
                //내가 댓글을 남긴 이슈들 (보류)
                case 3:
//                    filterIssue = filterIssue.filter { list in
//                        let isComment = false
//                        list.
//                        return isAssign
//                    }
                    print("Q보류")
                //닫힌 이슈들
                case 4:
                    filterIssue = filterIssue.filter {
                        $0.isOpen == false
                    }
                default:
                    break
                }
            }
            print(filterIssue)
            weakSelf.status.searchResultList.value = filterIssue
        }
        
    )
    
    init() {
        service.requestIssueListGet()
        status.issues.bindAndFire(updateResultListView)
    }
    
    func updateResultListView(issues: [IssueListModel]) {
        status.searchResultList.value = issues
    }
    
}
