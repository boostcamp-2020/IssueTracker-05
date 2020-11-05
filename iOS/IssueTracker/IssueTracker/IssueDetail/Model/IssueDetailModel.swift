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
 
    static func all() -> IssueDetailModel {
        IssueDetailModel(
            iid: 11,
            title: "title",
            isOpen: false,
            label: nil,
            content: nil,
            comments: Comment.all(),
            updatedAt: "22-2323-1212",
            createdAt: "22-2323-1212",
            author: nil,
            mid: nil,
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