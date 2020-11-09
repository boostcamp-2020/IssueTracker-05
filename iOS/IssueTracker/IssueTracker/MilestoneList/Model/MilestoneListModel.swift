import Foundation

struct Milestone: Hashable, Codable {
    
    var mid: Int
    var title: String
    var issues: [IssueState]?
    
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
//            Milestone(mid: 12, title: "스프린트", issues: [true, false, true]),
//            Milestone(mid: 2, title: "스프린트", issues: [true, false, true]),
//            Milestone(mid: 3, title: "스프린트", issues: [true, false, true]),
//            Milestone(mid: 4, title: "스프린트", issues: [true, false, true])
        ]
    }
}

struct IssueState: Hashable, Codable { // 이걸로 이슈 얼마나 열려있는지 확인

    var isOpen: Bool

    static func == (lhs: IssueState, rhs: IssueState) -> Bool {
        lhs.isOpen == rhs.isOpen
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(isOpen)

    }
}
