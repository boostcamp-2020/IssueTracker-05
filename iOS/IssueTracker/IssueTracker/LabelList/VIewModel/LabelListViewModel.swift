import Foundation

class LabelListViewModel {
    
    lazy var service = LabelListService(viewModel: self)
    
    struct Status {
        // 데이타 소스
        var labels = Bindable<[Label]>(Label.all())
        var selectedLabel
            = Bindable<Label>(Label(color: "", desc: "", name: ""))
    }
    
    struct Action {
        var cellTouched: (String, String, String) -> Void
        var labelEditSaveButtonDidTabbed: (String, String, String) -> Void
    }
    
    let status = Status()
    lazy var action = Action(
        cellTouched: { [weak self] title, desc, color in
            guard let weakSelf = self else { return }
            weakSelf.status.selectedLabel.value
                = Label(color: color,
                        desc: desc,
                        name: title)
        }, labelEditSaveButtonDidTabbed: { [weak self] title, desc, color in
            guard let weakSelf = self else { return }
            
            // title로 식별 같으면 변경 후 서버에 요청, 전체 label reload
            
            let newLabel = Label(color: color, desc: desc, name: title)
            weakSelf.status.labels.value.append(newLabel)
            weakSelf.status.labels.value = weakSelf.status.labels.value
        })
    
    init() {
        service.requestLabelListData()
    }
    
    
}
