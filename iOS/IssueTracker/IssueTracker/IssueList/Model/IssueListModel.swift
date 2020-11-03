
import Foundation

struct IssueListModel: Codable, Hashable {
    
    var isOpened: Bool
    var label: [String]
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
    
    static func all() -> [IssueListModel] {
        var newModel = [IssueListModel]()
        newModel.append(IssueListModel(isOpened: true, label: ["feature"], title: "레이블 목록 보기 구현", content: "레이블 전체 목록을 볼 수 있어야 한다\n 2줄까지 보입니다.", mId: "1", id: "1"))
        newModel.append(IssueListModel(isOpened: true, label: ["bug"], title: "마일스톤 목록 보기 구현", content: "레이블 전체 목록을 볼 수 있어야 한다\n 2줄까지 보입니다.", mId: "1", id: "1"))
        return newModel
    }
    
}
