
import Foundation

struct IssueListModel: Codable, Hashable {
    
    var iid: Int
    var title: String
    var content: String?
    var isOpen: Bool
    var mId: String? // 마일스톤 아이디
    var labels: [Label]?
    var assignees: [Assignees]?
    var user: User
    var comments: [IssueListComment]?
    
    static func == (lhs: IssueListModel, rhs: IssueListModel) -> Bool {
        return lhs.iid == rhs.iid
            && lhs.title == rhs.title
            && lhs.content == rhs.content
            && lhs.isOpen == rhs.isOpen
            && lhs.mId == rhs.mId
            && lhs.labels == rhs.labels
            && lhs.assignees == rhs.assignees
            && lhs.user == rhs.user
            && lhs.comments == rhs.comments
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(iid)
        hasher.combine(title)
        hasher.combine(content)
        hasher.combine(isOpen)
        hasher.combine(mId)
        hasher.combine(labels)
        hasher.combine(assignees)
        hasher.combine(comments)
    }
    
    static func all() -> [IssueListModel] {
        var newModel = [IssueListModel]()
        newModel.append(
            IssueListModel(
                iid: 11,
                title: "testtesttest",
                content: "Hello",
                isOpen: true,
                mId: nil,
                labels: Label.all(), user: User(uid: 1, userId: "123123", nickname: "123123"))
        )
        newModel.append(
            IssueListModel(
                iid: 75,
                title: "bugs",
                content: nil,
                isOpen: false,
                mId: nil,
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
