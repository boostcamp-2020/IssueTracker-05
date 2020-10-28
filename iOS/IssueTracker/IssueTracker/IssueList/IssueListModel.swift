
import Foundation

struct IssueListModel: Codable, Hashable {
    
    var isOpened: Bool
    var label: String
    var title: String
    var content: String
    var mId: String // 마일스톤 아이디
    var id: String
    
    static func == (lhs: IssueListModel, rhs: IssueListModel) -> Bool {
        return lhs.isOpened == rhs.isOpened
            && lhs.label == rhs.label
            && lhs.title == rhs.title
            && lhs.content == rhs.content
            && lhs.mId == rhs.mId
            && lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(isOpened)
        hasher.combine(label)
        hasher.combine(title)
        hasher.combine(content)
        hasher.combine(mId)
        hasher.combine(id)
    }
    
}
