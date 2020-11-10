
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
        var milestoneEditSaveButtonDidTabbed: (String, String, String, String?) -> Void
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
            
            
            
            
            
            if let id = id { // 수정
//                weakSelf.service.requestLabelPatch(
//                    oldName: id, name: title, desc: desc, color: color)
                weakSelf.status.resultOfSaving.value = .success
                return
            }
            
            //let labels = weakSelf.status.labels.value
//            for index in labels.indices {
//                if labels[index].name == title {
//                    weakSelf.status.resultOfSaving.value = .fail
//                    return
//                }
//            }
//            weakSelf.service.requestLabelPost(
//                name: title, desc: desc, color: color)
            weakSelf.status.resultOfSaving.value = .success
        }, deleteButtonTabbed: { [weak self] name in
            guard let weakSelf = self else { return }
            
//            weakSelf.service.requestLabelDelete(name: name)
            
            // 사용성을 위해 서버에서 응답을 받지 않았어도 셀을 삭제해주는 것을 고려해보자.
        }, refreshData: { [weak self] in
            guard let weakSelf = self else { return }
            
//            weakSelf.service.requestLabelListGet()
        })
    
    var status = Status()
    
}

