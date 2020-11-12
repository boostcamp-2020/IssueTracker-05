import Foundation

class MultiSelectiveEditingViewModel {
    
    //var touchedIDs = [Int]() // 얘를 카운트 한 만큼 TiTle을 표시해야 한다. title에 관한 데이터 바인더블 필요
    
    struct Status {
        var issues: Bindable<[IssueListModel]>
        // selectedCount -> title로 사용 - 선택할 때 마다 얘를 업데이트 해준다. 긜고 타이틀 변경함수를 바인딩해 놓는다.
    }
    
    struct Action {
        var cellTouched: (Int) -> Void // 같은 게 있으면 지움 -> 필터로 어케 될 듯?
        var closeSelectedIssues: () -> Void
    }
    
    var status: Status
    lazy var action = Action(
        cellTouched: { [weak self] id in
            guard let weakSelf = self else { return }
            var issues = weakSelf.status.issues.value
            for index in issues.indices {
                if issues[index].iid == id {
                    print("여기인가\(id)")
                    issues[index].isSelected.toggle()
                }
            }
            weakSelf.status.issues.value = issues // 발생
        }, closeSelectedIssues: {
            
            
        })
    
    init(issues: [IssueListModel]) {
        status = Status(issues: Bindable(issues))
    }
    
}
