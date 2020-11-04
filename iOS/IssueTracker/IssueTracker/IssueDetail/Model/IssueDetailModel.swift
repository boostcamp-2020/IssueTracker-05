import Foundation

struct IssueDetailModel: Hashable, Codable {
    
    var iid: Int
    var title: String // 이슈 타이틀
    var isOpen: Bool
    var label: [String]?
    var content: String?
    var comments: [Comment]?
    var updatedAt: String?
    var createdAt: String?
    var author: String?
    var mid: Int?
    var assignees: [Assignees]?
    
    static func == (lhs: IssueDetailModel, rhs: IssueDetailModel) -> Bool {
        lhs.iid == rhs.iid
            && lhs.title == rhs.title
            && lhs.isOpen == rhs.isOpen
            && lhs.label == rhs.label
            && lhs.content == rhs.content
            && lhs.createdAt == rhs.createdAt
            && lhs.author == rhs.author
            && lhs.mid == rhs.mid
            && lhs.assignees == rhs.assignees
            && lhs.comments == rhs.comments
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(iid)
        hasher.combine(title)
        hasher.combine(isOpen)
        hasher.combine(label)
        hasher.combine(content)
        hasher.combine(createdAt)
        hasher.combine(author)
        hasher.combine(mid)
        hasher.combine(assignees)
        hasher.combine(comments)
    }
    
}

struct Comment: Hashable, Codable {
    var cid: Int
    var content: String
    var iid: Int
    var uid: Int
    var updatedAt: String
    var createdAt: String
}

struct Milestone: Hashable, Codable {
    
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

struct Assignees: Hashable, Codable {
    
    var uid: Int
    
    static func == (lhs: Assignees, rhs: Assignees) -> Bool {
        lhs.uid == rhs.uid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
    }
}
