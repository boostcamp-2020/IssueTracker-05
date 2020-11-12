
import Foundation

extension Date {
    func lastTimeToString() -> String? {
        let toDate = self
        let calendar = Calendar(identifier: .gregorian)
        let offsetComps = calendar.dateComponents([.year,.month, .weekOfYear, .day, .hour, .minute], from: toDate, to: Date())
        if case let (year?, month?, weekOfYear?,day?, hour?, minute?)
            = (offsetComps.year, offsetComps.month, offsetComps.weekOfYear, offsetComps.day, offsetComps.hour, offsetComps.month) {
            if (year >= 2) {
                return "\(year)년 전"
            } else if (year >= 1){
                return "작년"
            } else if (month >= 2) {
                return "\(month)달 전"
            } else if (month >= 1){
                return "저번 달"
            } else if (weekOfYear >= 2) {
                return "\(weekOfYear)주 전"
            } else if (weekOfYear >= 1){
                return "저번 주"
            } else if (day >= 2) {
                return "\(day)일 전"
            } else if (day >= 1){
                return "어제"
            } else if (hour >= 2) {
                return "\(hour)시간 전"
            } else if (hour >= 1){
                return "1시간 전"
            } else if (minute >= 2) {
                return "\(minute)분 전"
            } else if (minute >= 1){
                return "1분 전"
            } else {
                return "방금"
            }
        }
        return nil
    }
}
