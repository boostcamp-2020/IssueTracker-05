
import Foundation
import Alamofire

enum MilestoneListResultType: String {
    case success = "성공"
    case title = "마일스톤의 제목을 입력해주세요."
    case date = "날자형식(yyyy-mm-dd)을 올바르게 입력해주세요."
}

class MilestoneListViewModel {
    
    lazy var service = MilestoneListService(viewModel: self)
    
    init() {
        service.requestMilestoneGet()
    }
    
    struct Status {
        var milestones = Bindable(Milestone.all())
        var selectedMilestone
            = Bindable<Milestone>(Milestone.all()[0])
        var resultOfSaving
            = Bindable(MilestoneListResultType.success)
    }
    
    struct Action {
        var cellTouched: (Milestone) -> Void
        var milestoneEditSaveButtonDidTabbed: (String, String, String, Int?) -> Void
        var deleteButtonTabbed: (String) -> Void
        var refreshData: () -> Void
    }
    
    lazy var action = Action(
        cellTouched: {
            [weak self] milestone in
            guard let weakSelf = self else { return }
            weakSelf.status.selectedMilestone.value = milestone
        }, milestoneEditSaveButtonDidTabbed: {
            [weak self] title, desc, date, id in
            guard let weakSelf = self else { return }
            
            
            if title == "" {
                weakSelf.status.resultOfSaving.value = .title
                return
            }
            
            if weakSelf.isValid(date: date) { // 날짜 형식 검사 로직이 들어가야 한다.
                weakSelf.status.resultOfSaving.value = .date
                return
            }
            
            if let id = id { // 수정
//                weakSelf.service.requestMilestonePatch(
//                    id: id, title: title, desc: desc, date: date)
                weakSelf.status.resultOfSaving.value = .success
                return
            }
            
            
//            weakSelf.service.requestLabelPost(
//                name: title, desc: desc, color: color)
            weakSelf.status.resultOfSaving.value = .success
        }, deleteButtonTabbed: { [weak self] name in
            guard let weakSelf = self else { return }
//            weakSelf.service.requestLabelDelete(name: name)
        }, refreshData: { [weak self] in
            guard let weakSelf = self else { return }
//            weakSelf.service.requestLabelListGet()
        })
    
    var status = Status()
    
    // 날짜 형식 검사 함수 구현
    func isValid(date: String) -> Bool {
        date == ""
    }
    
     // 날짜 형식 우리한테 맞게 변경 - 서비스에서 호출.
}

