import Foundation

struct Milestone: Hashable, Codable {
    
    var mid: Int
    var title: String
    var issues: IssueState
    
    static func == (lhs: Milestone, rhs: Milestone) -> Bool {
        lhs.mid == rhs.mid
            && lhs.title == rhs.title
            && lhs.issues == rhs.issues
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(mid)
        hasher.combine(title)
        hasher.combine(issues)
    }
    
    static func all() -> [Milestone] {
        [
            Milestone(mid: 12, title: "스프린트", issues: IssueState(open: 12, close: 36)),
            Milestone(mid: 2, title: "스프린트", issues: IssueState(open: 3, close: 5)),
            Milestone(mid: 3, title: "스프린트", issues: IssueState(open: 4, close: 14)),
            Milestone(mid: 4, title: "스프린트", issues: IssueState(open: 9, close: 12))
        ]
    }
}

struct IssueState: Hashable, Codable { // 이걸로 이슈 얼마나 열려있는지 확인
    
    var open: Int
    var close: Int
    
    static func == (lhs: IssueState, rhs: IssueState) -> Bool {
        lhs.open == rhs.open && lhs.close == rhs.close
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(open)
        hasher.combine(close)
    }
}
