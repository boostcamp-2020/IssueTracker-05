import Foundation

enum LabelListResultType: Error {
    case success
    case fail
}

extension LabelListResultType: LocalizedError {
    public var errorDescription: String? {
        NSLocalizedString("같은 이름의 레이블이 이미 존재합니다.", comment: "")
    }
}

class LabelListViewModel {
    
    lazy var service = LabelListService(viewModel: self)
    
    struct Status {
        // 데이타 소스
        var labels = Bindable<[Label]>(Label.all())
        var selectedLabel
            = Bindable<Label>(Label(color: "", desc: "", name: ""))
        var resultOfSaving = Bindable(LabelListResultType.fail)
    }
    
    struct Action {
        var cellTouched: (String, String, String) -> Void
        var labelEditSaveButtonDidTabbed: (String, String, String, String?) -> Void
    }
    
    let status = Status()
    lazy var action = Action(
        cellTouched: {
            [weak self] title, desc, color in
            guard let weakSelf = self else { return }
            weakSelf.status.selectedLabel.value = Label(
                color: color, desc: desc, name: title)
        }, labelEditSaveButtonDidTabbed: {
            [weak self] title, desc, color, id in
            guard let weakSelf = self else { return }
            
            if let _ = id { // id 존재 - 편집 모드 - 그냥 바로 쏘면 됨.
                // 서비스 객체 - 레이블 수정 함수.
                weakSelf.status.resultOfSaving.value = .success
                
                return
            }
            
            // id 없을 때 - 추가 모드 - id 겹치면 안된다.
            let labels = weakSelf.status.labels.value
            for index in labels.indices {
                if labels[index].name == title {
                    weakSelf.status.resultOfSaving.value = .fail
                    return
                }
            }
            weakSelf.service.requestAddLabel(name: title, desc: desc, color: color)
            weakSelf.status.resultOfSaving.value = .success
            
            // append만 해도 didset이 호출 되는지 test해보자.
            
            // 이 과정을 service 객체에서 해주면 된다.
            weakSelf.status.labels.value.append(Label(color: color, desc: desc, name: title))
            weakSelf.status.labels.value = weakSelf.status.labels.value
        })
    
    init() {
        service.requestLabelListData()
    }
    
}
