
import Foundation
import Alamofire

class MilestoneListViewModel {
    
    struct Status {
        var milestones: Bindable<[Milestone]>?
    }
    
    struct Action {
        
    }
    
    var status = Status()
    
}

