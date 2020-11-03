

import Foundation

class IssueListViewModel {
    
    //TODO: 여기서 서버로부터 데이터를 받아온다. 서비스 객체가 여기에 존재. - 아직은 아웃풋 데이터 발생만 발생할 것으로 예상된다.
    
    struct Status {
        var model =  Bindable(IssueListModel.all())
    }
    
//    struct Action {
//        func search: (String) -> Void
//    }
    
    var status = Status()
    //var Action = Action()
    
}
