//
//  Section.swift
//  IssueTracker
//
//  Created by 조정래 on 2020/11/11.
//  Copyright © 2020 ralph. All rights reserved.
//

import Foundation

class Item: Hashable {
    var name: String
    var check: Bool
    
    init(name: String, check: Bool) {
        self.name = name
        self.check = check
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(check)
    }
    
    // 3
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.name == rhs.name &&
            lhs.check == rhs.check
    }
}

class Section: Hashable {
    var title: String
    var items: [Item]
    
    init(title: String, items: [Item]) {
        self.title = title
        self.items = items
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    static func == (lhs: Section, rhs: Section) -> Bool {
        lhs.title == rhs.title
    }
}

extension Section {
    static var allSections: [Section] = [
        Section(title: "다음 중에 조건을 고르세요", items: [
            Item(name: "열린 이슈들", check: false),
            Item(name: "내가 작성한 이슈들", check: false),
            Item(name: "나한테 할당된 이슈들", check: false),
            Item(name: "내가 댓글을 남긴 이슈들", check: false),
            Item(name: "닫힌 이슈들", check: false)
        ]),
        Section(title: "세부 조건", items: [
            Item(name: "작성자", check: false),
            Item(name: "레이블", check: false),
            Item(name: "마일스톤", check: false),
            Item(name: "담당자", check: false)
        ])
    ]
}
