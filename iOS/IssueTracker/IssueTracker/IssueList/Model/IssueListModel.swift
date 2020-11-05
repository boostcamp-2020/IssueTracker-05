
import Foundation

struct Label: Codable, Hashable {
    var color: String
    var desc: String?
    var name: String
    
    static func == (lhs: Label, rhs: Label) -> Bool {
        return lhs.color == rhs.color
            && lhs.desc == rhs.desc
            && lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(color)
        hasher.combine(desc)
        hasher.combine(name)
    }
    
    static func all() -> [Label] {
        return [
            Label(color: "#0075ca", desc: "Improvements or additions to documentation", name: "documentation")
        ]
    }
}

struct IssueListModel: Codable, Hashable {
    
    var iid: Int
    var title: String
    var content: String?
    var isOpen: Bool
    var mId: String? // 마일스톤 아이디
    var labels: [Label]?
    var assignees: [Assignees]?
    //var user: User
    
    static func == (lhs: IssueListModel, rhs: IssueListModel) -> Bool {
        return lhs.iid == rhs.iid
            && lhs.title == rhs.title
            && lhs.content == rhs.content
            && lhs.isOpen == rhs.isOpen
            && lhs.mId == rhs.mId
            && lhs.labels == rhs.labels
            && lhs.assignees == rhs.assignees
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(iid)
        hasher.combine(title)
        hasher.combine(content)
        hasher.combine(isOpen)
        hasher.combine(mId)
        hasher.combine(labels)
        hasher.combine(assignees)
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
                labels: Label.all())
        )
        newModel.append(
            IssueListModel(
                iid: 75,
                title: "bugs",
                content: nil,
                isOpen: false,
                mId: nil,
                labels: Label.all())
        )
        return newModel
    }
    
}
