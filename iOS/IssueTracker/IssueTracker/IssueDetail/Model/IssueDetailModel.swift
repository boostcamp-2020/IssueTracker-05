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
            title: "이슈 제목",
            isOpen: true,
            labels: nil,
            content: "이슈 내용",
            comments: Comment.all(),
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
                    content: "하단 메뉴를 잡아서 위로 끌어올리면, 담당자, 레이블과 마일스톤을 영역으로 나눠서 표시한다. [Edit] 버튼을 누르면 담당자, 레이블, 마일스톤 목록이 나오고 선택할 수 있다",
                    createdAt: "12312312313123",
                    user: User(
                        uid: 22,
                        userId: "정명짱",
                        nickname: "짱짱짱정재명")),
            Comment(cid: 2,
                    content: "하단 메뉴를 잡아서 위로 끌어올리면, 담당자, 레이블과 마일스톤을 영역으로 나눠서 표시한다. [Edit] 버튼을 누르면 담당자, 레이블, 마일스톤 목록이 나오고 선택할 수 있다",
                    createdAt: "12312312233123123123123",
                    user: User(
                        uid: 232,
                        userId: "재명짱",
                        nickname: "짱짱짱정재명")),
            Comment(cid: 3,
                    content: "하단 메뉴를 잡아서 위로 끌어올리면, 담당자, 레이블과 마일스톤을 영역으로 나눠서 표시한다. [Edit] 버튼을 누르면 담당자, 레이블, 마일스톤 목록이 나오고 선택할 수 있다",
                    createdAt: "1231231231231233123123123123",
                    user: User(
                        uid: 222,
                        userId: "정재짱",
                        nickname: "짱짱정재명")),
            Comment(cid: 4,
                    content: "하뉴를 잡아서 위로 끌어올리면, 담당자, 레이블과 마일스톤을 영역으로 나눠서 표시한다. [Edit] 버튼을 누르면단 메 담당자, 레이블, 마일스톤 목록이 나오고 선택할 수 있다",
                    createdAt: "12312312312312331233",
                    user: User(
                        uid: 23,
                        userId: "정재명짱",
                        nickname: "짱짱짱정재명")),
            Comment(cid: 5,
                    content: "하단 메뉴를 잡아서 위로 끌어올리면, 담당자, 레이블과 마일스톤을 영역으로 나눠서 표시한다. [Edit] 버튼을 누르면 담당자, 레이블, 마일스톤 목록이 뉴를 잡아서 위로 끌어올리면, 담당자, 레이블과 마일스톤을 영역으로 나눠서 표시한다. [Edit] 버튼을 누르면나오고 선택할 수 뉴를 잡아서 위로 끌어올리면, 담당자, 레이블과 마일스톤을 영역으로 나눠서 표시한다. [Edit] 버튼을 누르면있다",
                    createdAt: "1231231231231233123123123123",
                    user: User(
                        uid: 12,
                        userId: "정재명짱",
                        nickname: "짱짱짱정재명"))
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
