import Foundation

struct IssueDetailModel: Hashable {
    
    var iid: Int
    var title: String // 이슈 타이틀
    var isOpen: Bool
    var label: [String]?
    var content: String?
    var createdAt: String?
    var author: String
    var milestone: [Milestone]
    var assignees: [Assignees]?
    
    static func == (lhs: IssueDetailModel, rhs: IssueDetailModel) -> Bool {
        lhs.iid == rhs.iid
            && lhs.title == rhs.title
            && lhs.isOpen == rhs.isOpen
            && lhs.label == rhs.label
            && lhs.content == rhs.content
            && lhs.createdAt == rhs.createdAt
            && lhs.author == rhs.author
            && lhs.milestone == rhs.milestone
            && lhs.assignees == rhs.assignees
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(iid)
        hasher.combine(title)
        hasher.combine(isOpen)
        hasher.combine(label)
        hasher.combine(content)
        hasher.combine(createdAt)
        hasher.combine(author)
        hasher.combine(milestone)
        hasher.combine(assignees)
    }
}

struct Milestone: Hashable {
    
    var mid: String
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
}

struct IssueState: Hashable { // 이걸로 이슈 얼마나 열려있는지 확인
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

struct Assignees: Hashable {
    
    var uid: Int
    
    static func == (lhs: Assignees, rhs: Assignees) -> Bool {
        lhs.uid == rhs.uid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
    }
}
