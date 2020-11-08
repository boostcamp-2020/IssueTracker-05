
import Foundation
import Alamofire

class MilestoneListViewModel {
    
    struct Status {
        var milestones = Bindable(Milestone.all())
    }
    
    struct Action {
        
    }
    
    var status = Status()
    
}

