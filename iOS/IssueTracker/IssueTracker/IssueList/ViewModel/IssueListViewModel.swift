
import Foundation

class IssueListViewModel {
    
    lazy var service = IssueListService(viewModel: self)
    
    struct Status {
        var issues =  Bindable(IssueListModel.all())
        var searchResultTitleList = Bindable([String]())
        var searchResultList = Bindable(IssueListModel.all())
        // reulstOfFiltering = Bindable(IssueListModel.all()) <-> snapshot()
    }
    
    struct Action {
        var searchTextChanged: (String) -> Void
        var searchButtonClicked: (String) -> Void
        var searchCancelButtonClicked: () -> Void
        var closeButtonTabbed: (Int) -> Void
        var deleteButtonTabbed: (Int) -> Void
        
        // 필터링
        // Done(bool, , , , , ,)
        //issues.filter{}
        
        // 다중 선택
        
        // 이슈 추가, 수정
        
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
            print(iid, "close")
            weakSelf.service.requestIssueClose(issueId: iid)
        }, deleteButtonTabbed: { [weak self] iid in
            guard let weakSelf = self else { return }
            print(iid, "delete")
            weakSelf.service.requestIssueDelete(issueId: iid)
            for index in weakSelf.status.issues.value.indices {
                if weakSelf.status.issues.value[index].iid == iid {
                    weakSelf.status.issues.value.remove(at: index)
                   return
                }
            }
        })
    
    init() {
        service.requestIssueListGet()
        status.issues.bindAndFire(updateResultListView)
    }
    
    func updateResultListView(issues: [IssueListModel]) {
        status.searchResultList.value = issues
    }
    
}
