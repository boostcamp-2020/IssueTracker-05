
import Foundation

class SearchListViewModel {
        
    struct Status {
        var model = Bindable(IssueListModel.all())
    }
    
    struct Action {
        var searchTextChanged: (String) -> Void
    }
    
    var status = Status()
    var origin = IssueListModel.all()
    lazy var action = Action(searchTextChanged: search)
    
    func search(text: String) {
        status.model.value = origin.filter {
            $0.title.contains(text)
        }
    }
    
    
}
