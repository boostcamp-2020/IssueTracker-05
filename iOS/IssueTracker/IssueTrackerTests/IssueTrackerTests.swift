//
//  IssueTrackerTests.swift
//  IssueTrackerTests
//
//  Created by 조정래 on 2020/11/11.
//  Copyright © 2020 ralph. All rights reserved.
//

import XCTest

class IssueTrackerTests: XCTestCase {

    func test_아이디가_6자이하이면_유효하지않다() throws {
        
        var id = "12345"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertFalse(idCheck)
        })
        
        viewModel.action.idTextFieldChanged(id)
        
    }

    func test_아이디가_16자초과이면_유효하지않다() throws {
        
        var id = "12345123451234512"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertFalse(idCheck)
        })
        
        viewModel.action.idTextFieldChanged(id)
        
    }
    
    func test_아이디가_6자이상_16자이하이면_유효하다() throws {
        
        var id = "1234512345"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertTrue(idCheck)
        })
        
        viewModel.action.idTextFieldChanged(id)
        
    }
    
    func test_비밀번호가_6자이하이면_유효하지않다() throws {
        
        var password = "1234"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertFalse(passwordCheck)
        })
        
        viewModel.action.passwordTextFieldChanged(password)
    }

    func test_비밀번호_12자초과이면_유효하지않다() throws {
        
        var password = "1234512345123"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertFalse(passwordCheck)
        })
        
        viewModel.action.passwordTextFieldChanged(password)
        
    }

    func test_비밀번호_6자이상_12자이하이면_유효하다() throws {
        
        var password = "a1a!a1"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertTrue(passwordCheck)
        })
        
        viewModel.action.passwordTextFieldChanged(password)
        
    }

    
    
    
}
