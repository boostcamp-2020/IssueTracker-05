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
            Label(color: "#0075cb", desc: "Improvements or additions to documentation", name: "documentatdion"),
            Label(color: "#0075cb", desc: "Improvements or additions to documentation", name: "documeantation"),
            Label(color: "#0070ca", desc: "Improvements or additions to documentation", name: "dodasdn")
        ]
    }
}
