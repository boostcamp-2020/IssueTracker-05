import Foundation

class LabelListViewModel {
    
    lazy var service = LabelListService(viewModel: self)
    
    struct Status {
        // 데이타 소스
        var labels = Bindable([Label]())
    }
    
    struct Action {
        // cell tabbed
        // 이슈 추가
        
        // + 버튼 -> 이건 코디 네이터
    }
    
    let status = Status()
    
    init() {
        service.requestLabelListData()
    }
    
    
}
