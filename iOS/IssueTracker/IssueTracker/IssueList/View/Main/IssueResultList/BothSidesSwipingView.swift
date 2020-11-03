import UIKit

class BothSidesSwipingView: UIView {
    var withDuration = 0.4
    var delay = 0.0
    var usingSpringWithDamping: CGFloat = 0.5
    var initialVelocity: CGFloat = 0.3
    var buttonWidthRatio: CGFloat = 0.2
    
    var swipeRecognizerLeft: UISwipeGestureRecognizer!
    var swipeRecognizerRight: UISwipeGestureRecognizer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSwipeBothSides()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupSwipeBothSides()
    }
    
    func setupSwipeBothSides() {
        swipeRecognizerLeft = UISwipeGestureRecognizer(
            target: self, action: #selector(swipeActionLeft))
        swipeRecognizerLeft.direction = .left
        swipeRecognizerRight = UISwipeGestureRecognizer(
            target: self, action: #selector(swipeActionRight))
        swipeRecognizerRight.direction = .right
        self.addGestureRecognizer(swipeRecognizerLeft)
        self.addGestureRecognizer(swipeRecognizerRight)
    }
    
    @objc func swipeActionLeft(_ sender: Any) {
        let width = swipeRecognizerLeft.direction == .left ?
            self.frame.width * buttonWidthRatio : -self.frame.width * buttonWidthRatio
        let newFrame = CGRect(
            x: self.frame.origin.x - width,
            y: self.frame.origin.y,
            width: self.frame.width, height: self.frame.height)
        animate(to: newFrame)
        swipeRecognizerLeft.direction
            = swipeRecognizerLeft.direction == .left ? .right : .left
    }
    
    @objc func swipeActionRight(_ sender: Any) {
        let width = swipeRecognizerRight.direction == .right ?
            self.frame.width * buttonWidthRatio : -self.frame.width * buttonWidthRatio
        let newFrame = CGRect(
            x: self.frame.origin.x + width,
            y: self.frame.origin.y,
            width: self.frame.width, height: self.frame.height)
        animate(to: newFrame)
        swipeRecognizerRight.direction
            = swipeRecognizerRight.direction == .right ? .left : .right
    }
    
    func animate(to newFrame: CGRect) {
        UIView.animate(
            withDuration: withDuration,
            delay: delay,
            usingSpringWithDamping: usingSpringWithDamping,
            initialSpringVelocity: initialVelocity,
            options: .curveEaseInOut,
            animations: {
            self.frame = newFrame
        })
    }
}
