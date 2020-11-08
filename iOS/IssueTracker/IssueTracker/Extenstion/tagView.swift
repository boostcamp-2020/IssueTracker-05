//
//  tagView.swift
//  IssueTracker
//
//  Created by cho on 2020/11/08.
//  Copyright © 2020 ralph. All rights reserved.
//

//import UIKit

//@IBDesignable
//open class TagView: UIButton {
//
//    @IBInspectable open override var cornerRadius: CGFloat {
//        didSet {
//            layer.cornerRadius = cornerRadius
//            layer.masksToBounds = cornerRadius > 0
//        }
//    }
//    @IBInspectable open override var borderWidth: CGFloat {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//
//    @IBInspectable open override var borderColor: UIColor? {
//        didSet {
//            reloadStyles()
//        }
//    }
//
//    @IBInspectable open var textColor: UIColor = UIColor.white {
//        didSet {
//            reloadStyles()
//        }
//    }
//    @IBInspectable open var selectedTextColor: UIColor = UIColor.white {
//        didSet {
//            reloadStyles()
//        }
//    }
//    @IBInspectable open var titleLineBreakMode: NSLineBreakMode = .byTruncatingMiddle {
//        didSet {
//            titleLabel?.lineBreakMode = titleLineBreakMode
//        }
//    }
//    @IBInspectable open var paddingY: CGFloat = 2 {
//        didSet {
//            titleEdgeInsets.top = paddingY
//            titleEdgeInsets.bottom = paddingY
//        }
//    }
//    @IBInspectable open var paddingX: CGFloat = 5 {
//        didSet {
//            titleEdgeInsets.left = paddingX
//            updateRightInsets()
//        }
//    }
//
//    @IBInspectable open var tagBackgroundColor: UIColor = UIColor.gray {
//        didSet {
//            reloadStyles()
//        }
//    }
//
//    @IBInspectable open var highlightedBackgroundColor: UIColor? {
//        didSet {
//            reloadStyles()
//        }
//    }
//
//    @IBInspectable open var selectedBorderColor: UIColor? {
//        didSet {
//            reloadStyles()
//        }
//    }
//
//    @IBInspectable open var selectedBackgroundColor: UIColor? {
//        didSet {
//            reloadStyles()
//        }
//    }
//
//    @IBInspectable open var textFont: UIFont = .systemFont(ofSize: 12) {
//        didSet {
//            titleLabel?.font = textFont
//        }
//    }
//
//    private func reloadStyles() {
//        if isHighlighted {
//            if let highlightedBackgroundColor = highlightedBackgroundColor {
//                // For highlighted, if it's nil, we should not fallback to backgroundColor.
//                // Instead, we keep the current color.
//                backgroundColor = highlightedBackgroundColor
//            }
//        }
//        else if isSelected {
//            backgroundColor = selectedBackgroundColor ?? tagBackgroundColor
//            layer.borderColor = selectedBorderColor?.cgColor ?? borderColor?.cgColor
//            setTitleColor(selectedTextColor, for: UIControl.State())
//        }
//        else {
//            backgroundColor = tagBackgroundColor
//            layer.borderColor = borderColor?.cgColor
//            setTitleColor(textColor, for: UIControl.State())
//        }
//    }
//
//    override open var isHighlighted: Bool {
//        didSet {
//            reloadStyles()
//        }
//    }
//
//    override open var isSelected: Bool {
//        didSet {
//            reloadStyles()
//        }
//    }
//
//    /// Handles Tap (TouchUpInside)
//    open var onTap: ((TagView) -> Void)?
//    open var onLongPress: ((TagView) -> Void)?
//
//    // MARK: - init
//
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        setupView()
//    }
//
//    public init(title: String) {
//        super.init(frame: CGRect.zero)
//        setTitle(title, for: UIControl.State())
//
//        setupView()
//    }
//
//    private func setupView() {
//         titleLabel?.lineBreakMode = titleLineBreakMode
//
//         frame.size = intrinsicContentSize
//
//         let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress))
//         self.addGestureRecognizer(longPress)
//     }
//
//
//    @objc func longPress() {
//        onLongPress?(self)
//    }
//
//    // MARK: - layout
//    override open var intrinsicContentSize: CGSize {
//        var size = titleLabel?.text?.size(withAttributes: [NSAttributedString.Key.font: textFont]) ?? CGSize.zero
//        size.height = textFont.pointSize + paddingY * 2
//        size.width += paddingX * 2
//        if size.width < size.height {
//            size.width = size.height
//        }
//        return size
//    }
//
//    private func updateRightInsets() {
//        titleEdgeInsets.right = paddingX
//    }
//
//}
//
///// Swift < 4.2 support
//#if !(swift(>=4.2))
//private extension NSAttributedString {
//    typealias Key = NSAttributedStringKey
//}
//private extension UIControl {
//    typealias State = UIControlState
//}
//#endif
