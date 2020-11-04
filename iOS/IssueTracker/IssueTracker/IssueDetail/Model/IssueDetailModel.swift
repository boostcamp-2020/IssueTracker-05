import Foundation

struct Comment: Hashable {
    var title: String
    var user: String
    var content: String
    
    static func == (lhs: Comment, rhs: Comment) -> Bool {
        lhs.title == rhs.title
            && lhs.user == rhs.user
            && lhs.content == rhs.content
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(user)
        hasher.combine(content)
    }
    
    static func all() -> [Comment] {
        [
            Comment(title: "dd", user: "조정래", content: "그런가그런가그런가그가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가"),
            Comment(title: "그렇군", user: "정재명", content: "이잉유유으으으아아이잉유유으으으아잉유유으으으아아"),
            Comment(title: "그러하다", user: "뿡뿡뽕뽕", content: "그런가그런가그런가그가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가"),
            Comment(title: "그러하다", user: "뿡뿡뽕", content: "그런가그런가그런가그가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가"),
            Comment(title: "그러하다", user: "뿡뿡뽕뽕뽕", content: "그런가그런가그런가그가그런가그런가그런그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가그런가")
        ]
    }
}


struct IssueDetailModel: Hashable {
    
    var iid: Int
    var title: String // 이슈 타이틀
    var isOpen: Bool
    var label: [String]?
    var content: String?
    
    var comment: [Comment]?
    
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
            && lhs.comment == rhs.comment
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
        hasher.combine(comment)
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
