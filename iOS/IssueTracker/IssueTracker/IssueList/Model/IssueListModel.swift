
import Foundation

struct IssueListModel: Codable, Hashable {
    
    var iid: Int
    var title: String
    var content: String?
    var isOpen: Bool
    var labels: [Label]?
    var assignees: [Assignees]?
    var user: User
    var comments: [IssueListComment]?
    var isSelected: Bool = false
//
    init(iid: Int, title: String, content: String? = nil, isOpen: Bool,labels:[Label]? = nil,
         assignees: [Assignees]? = nil, user: User, comments: [IssueListComment]? = nil) {
        self.iid = iid
        self.title = title
        self.content = content
        self.isOpen = isOpen
        self.labels = labels
        self.assignees = assignees
        self.user = user
        self.comments = comments
    }
    
    enum CodingKeys: String, CodingKey {
        case iid
        case title
        case content
        case isOpen
        case labels
        case assignees
        case user
        case comments
    }
    
    init(from decoder: Decoder) throws {
        let value  = try decoder.container(keyedBy: CodingKeys.self)
        iid = try value.decode(Int.self, forKey: .iid)
        title = try value.decode(String.self, forKey: .title)
        content = try value.decode(String?.self, forKey: .content)
        isOpen = try value.decode(Bool.self, forKey: .isOpen)
        labels = try value.decode([Label]?.self, forKey: .labels)
        assignees = try value.decode([Assignees]?.self, forKey: .assignees)
        user = try value.decode(User.self, forKey: .user)
        comments = try value.decode([IssueListComment]?.self, forKey: .comments)
    }
    
    static func == (lhs: IssueListModel, rhs: IssueListModel) -> Bool {
        return lhs.iid == rhs.iid
            && lhs.title == rhs.title
            && lhs.content == rhs.content
            && lhs.isOpen == rhs.isOpen
            && lhs.labels == rhs.labels
            && lhs.assignees == rhs.assignees
            && lhs.user == rhs.user
            && lhs.comments == rhs.comments
            && lhs.isSelected == rhs.isSelected
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(iid)
        hasher.combine(title)
        hasher.combine(content)
        hasher.combine(isOpen)
        hasher.combine(labels)
        hasher.combine(assignees)
        hasher.combine(comments)
        hasher.combine(isSelected)
    }
    
    static func all() -> [IssueListModel] {
        var newModel = [IssueListModel]()
        newModel.append(
            IssueListModel(
                iid: 11,
                title: "testtesttest",
                content: "Hello",
                isOpen: true,
                labels: Label.all(), user: User(uid: 1, userId: "123123", nickname: "123123"))
        )
        newModel.append(
            IssueListModel(
                iid: 75,
                title: "bugs",
                content: nil,
                isOpen: false,
                labels: Label.all(), user: User(uid: 2, userId: "123124", nickname: "123124"))
        )
        newModel.append(
            IssueListModel(
                iid: 55,
                title: "bugs",
                content: nil,
                isOpen: false,
                labels: Label.all(), user: User(uid: 2, userId: "123124", nickname: "123124"))
        )
        newModel.append(
            IssueListModel(
                iid: 25,
                title: "bugs",
                content: nil,
                isOpen: false,
                labels: Label.all(), user: User(uid: 2, userId: "123124", nickname: "123124"))
        )
        newModel.append(
            IssueListModel(
                iid: 225,
                title: "bugs",
                content: nil,
                isOpen: false,
                labels: Label.all(), user: User(uid: 2, userId: "123124", nickname: "123124"))
        )
        newModel.append(
            IssueListModel(
                iid: 235,
                title: "bugs",
                content: nil,
                isOpen: false,
                labels: Label.all(), user: User(uid: 2, userId: "123124", nickname: "123124"))
        )
        newModel.append(
            IssueListModel(
                iid: 325,
                title: "bugs",
                content: nil,
                isOpen: false,
                labels: Label.all(), user: User(uid: 2, userId: "123124", nickname: "123124"))
        )
        newModel.append(
            IssueListModel(
                iid: 2215,
                title: "bugs",
                content: nil,
                isOpen: false,
                labels: Label.all(), user: User(uid: 2, userId: "123124", nickname: "123124"))
        )
        return newModel
    }
 
}

struct IssueListComment: Hashable, Codable {
    
    var uid: Int
    
    static func == (lhs: IssueListComment, rhs: IssueListComment) -> Bool {
        return lhs.uid == rhs.uid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
    }
}
