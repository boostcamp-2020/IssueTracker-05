import Foundation

struct Milestone: Hashable, Codable {
    
    var mid: Int
    var title: String
    var content: String?
    var createdAt: String?
    var dueDate: String?
    var issues: [IssueState]?
    
    static func == (lhs: Milestone, rhs: Milestone) -> Bool {
        lhs.mid == rhs.mid
            && lhs.title == rhs.title
            && lhs.content == rhs.content
            && lhs.createdAt == rhs.createdAt
            && lhs.dueDate == rhs.dueDate
            && lhs.issues == rhs.issues
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(mid)
        hasher.combine(title)
        hasher.combine(content)
        hasher.combine(createdAt)
        hasher.combine(dueDate)
        hasher.combine(issues)
    }
    
    static func all() -> [Milestone] {
        [
            Milestone(mid: 1000, title: "hello", content: "contewntekalksdj", createdAt: "", dueDate: "", issues: IssueState.all()),
            Milestone(mid: 2010, title: "hlo", content: "contentekalkssdj", createdAt: "", dueDate: "", issues: IssueState.all()),
            Milestone(mid: 3001, title: "hllo", content: "contentekddalksdj", createdAt: "", dueDate: "", issues: IssueState.all())
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
    
    static func all() -> [IssueState] {
        [
            IssueState(isOpen: true),
            IssueState(isOpen: false),
            IssueState(isOpen: false),
            IssueState(isOpen: false),
            IssueState(isOpen: false),
            IssueState(isOpen: false),
            IssueState(isOpen: false),
            IssueState(isOpen: true),
            IssueState(isOpen: true)
        ]
    }
    
}
