//
//  UserInfo.swift
//  IssueTracker
//
//  Created by cho on 2020/10/29.
//  Copyright © 2020 ralph. All rights reserved.
//

import Foundation

class LoginModel {
    
    var id = ""
    var password = ""
    
    convenience init(id : String, password : String) {
        self.init()
        self.id = id
        self.password = password
    }
    
}
