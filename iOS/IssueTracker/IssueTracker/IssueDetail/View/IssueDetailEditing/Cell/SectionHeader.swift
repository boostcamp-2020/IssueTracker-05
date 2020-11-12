//
//  SectionHeader.swift
//  IssueTracker
//
//  Created by cho on 2020/11/08.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBAction func touchedEditButton(_ sender: Any) {
        Toast.shared.showToast(message: "미 구현 기능입니다", view: window!.rootViewController!.view )
    }
}
