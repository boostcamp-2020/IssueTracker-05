import Foundation

struct IssueDetailModel: Hashable, Codable {
    
    var iid: Int
    var title: String // 이슈 타이틀
    var isOpen: Bool
    var labels: [Label]?
    var content: String?
    var comments: [Comment]?
    var updatedAt: String?
    var createdAt: String?
    var milestone: Milestone?
    var assignees: [Assignees]?
    
    static func == (lhs: IssueDetailModel, rhs: IssueDetailModel) -> Bool {
        lhs.iid == rhs.iid
            && lhs.title == rhs.title
            && lhs.isOpen == rhs.isOpen
            && lhs.labels == rhs.labels
            && lhs.content == rhs.content
            && lhs.createdAt == rhs.createdAt
            && lhs.milestone == rhs.milestone
            && lhs.assignees == rhs.assignees
            && lhs.comments == rhs.comments
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(iid)
        hasher.combine(title)
        hasher.combine(isOpen)
        hasher.combine(labels)
        hasher.combine(content)
        hasher.combine(createdAt)
        hasher.combine(milestone)
        hasher.combine(assignees)
        hasher.combine(comments)
    }
 
    static func all() -> IssueDetailModel {
        IssueDetailModel(
            iid: 11,
            title: "",
            isOpen: true,
            labels: nil,
            content: "",
            comments: [Comment](),
            updatedAt: "22-2323-1212",
            createdAt: "22-2323-1212",
            milestone: Milestone.all()[0],
            assignees: nil)
    }
}

struct User: Hashable, Codable {
    var uid: Int
    var userId: String
    var nickname: String
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.uid == rhs.uid
            && lhs.userId == rhs.userId
            && lhs.nickname == rhs.nickname
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
        hasher.combine(userId)
        hasher.combine(nickname)
    }
}

struct Comment: Hashable, Codable {
    //TODO: image 추가되어야 한다.
    var cid: Int
    var content: String
    var createdAt: String
    var user: User
    
    
    static func == (lhs: Comment, rhs: Comment) -> Bool {
        lhs.cid == rhs.cid
            && lhs.content == rhs.content
            && lhs.createdAt == rhs.createdAt
            && lhs.user == rhs.user
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(content)
        hasher.combine(content)
        hasher.combine(createdAt)
        hasher.combine(user)
    }
    
    static func all() -> [Comment] {
        [
            Comment(cid: 1,
                    content: "짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명",
                    createdAt: "12312312313123",
                    user: User(
                        uid: 22,
                        userId: "조정래명",
                        nickname: "짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명짱짱짱조정래명"))
        ]
    }
}

struct Assignees: Hashable, Codable {
    var uid: Int
    var userId: String
    var nickname: String
    
    static func == (lhs: Assignees, rhs: Assignees) -> Bool {
        lhs.uid == rhs.uid
            && lhs.userId == rhs.userId
            && lhs.nickname == rhs.nickname
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
        hasher.combine(userId)
        hasher.combine(nickname)
    }
}
