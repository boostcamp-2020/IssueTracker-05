import Foundation

class LabelListViewModel {
    
    lazy var service = LabelListService(viewModel: self)
    
    struct Status {
        // 데이타 소스
        var labels = Bindable([Label]())
    }
    
    struct Action {
        // cell tabbed -> 레이블 편집 모드
        
        // label 추가
        var labelEditSaveButtonDidTabbed: (String, String, String) -> Void
    }
    
    let status = Status()
    lazy var action = Action(
        labelEditSaveButtonDidTabbed: { [weak self] title, desc, color in
            guard let weakSelf = self else { return }
            let newLabel = Label(color: color, desc: desc, name: title)
            weakSelf.status.labels.value.append(newLabel)
            weakSelf.status.labels.value = weakSelf.status.labels.value
        })
    
    init() {
        service.requestLabelListData()
    }
    
    
}
