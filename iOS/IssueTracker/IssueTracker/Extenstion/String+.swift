import Foundation
import UIKit

extension String {
    func hexToColor() -> UIColor? {

        var string = self
        
        if string.hasPrefix("#") {
            string.removeFirst()
        }
        
        if string.count != 6 {
            return nil
        }
        
        // 문자인데 아래 문자가 아니면 변환 불가
        for index in string.indices {
            if string[index].isLetter
                && !"ABCDEFabcdef"
                .contains(string[index]) {
                return nil
            }
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: string).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
    }
}
