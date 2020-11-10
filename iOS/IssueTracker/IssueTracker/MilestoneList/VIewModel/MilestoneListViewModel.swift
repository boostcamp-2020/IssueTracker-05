
import Foundation
import Alamofire

class MilestoneListViewModel {
    
    lazy var service = MilestoneListService(viewModel: self)
    
    init() {
        service.requestMilestoneGet()
    }
    
    struct Status {
        var milestones = Bindable(Milestone.all())
        var selectedLabel
            = Bindable<Milestone>(Milestone.all()[0])
    }
    
    struct Action {
        var cellTouched: (String, String, String) -> Void
        var labelEditSaveButtonDidTabbed: (String, String, String, String?) -> Void
        var deleteButtonTabbed: (String) -> Void
        var refreshData: () -> Void
    }
    
    lazy var action = Action(
        cellTouched: {
            [weak self] title, desc, color in
            guard let weakSelf = self else { return }
            
//            weakSelf.status.selectedLabel.value = Label(
//                color: color, desc: desc, name: title)
            
        }, labelEditSaveButtonDidTabbed: {
            [weak self] title, desc, color, id in
            guard let weakSelf = self else { return }
            
            if let id = id { // 수정
//                weakSelf.service.requestLabelPatch(
//                    oldName: id, name: title, desc: desc, color: color)
//                weakSelf.status.resultOfSaving.value = .success
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
//            weakSelf.status.resultOfSaving.value = .success
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

