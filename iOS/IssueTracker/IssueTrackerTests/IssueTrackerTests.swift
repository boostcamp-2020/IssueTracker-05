//
//  IssueTrackerTests.swift
//  IssueTrackerTests
//
//  Created by 조정래 on 2020/11/11.
//  Copyright © 2020 ralph. All rights reserved.
//

import XCTest

class IssueTrackerTests: XCTestCase {

    func test_Login_입력아이디가_6자미만이면_유효하지않다() throws {
        
        let id = "12345"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertFalse(idCheck)
        })
        
        viewModel.action.idTextFieldChanged(id)
        
    }

    func test_Login_입력아이디가_16자초과이면_유효하지않다() throws {
        
        let id = "12345123451234512"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertFalse(idCheck)
        })
        
        viewModel.action.idTextFieldChanged(id)
        
    }
    
    func test_Login_입력아이디가_6자이상_16자이하이면_유효하다() throws {
        
        let id = "1234512345"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertTrue(idCheck)
        })
        
        viewModel.action.idTextFieldChanged(id)
        
    }
    
    func test_Login_입력비밀번호가_6자미만이면_유효하지않다() throws {
        
        let password = "1234"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertFalse(passwordCheck)
        })
        
        viewModel.action.passwordTextFieldChanged(password)
    }

    func test_Login_입력비밀번호_12자초과이면_유효하지않다() throws {
        
        let password = "1234512345123"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertFalse(passwordCheck)
        })
        
        viewModel.action.passwordTextFieldChanged(password)
        
    }

    func test_Login_입력비밀번호_6자이상_12자이하이면_유효하다() throws {
        
        let password = "a1a!a1"
        let viewModel = SignInViewModel()
        
        viewModel.status.buttonEnabled.bind({ idCheck, passwordCheck in
            XCTAssertTrue(passwordCheck)
        })
        
        viewModel.action.passwordTextFieldChanged(password)
        
    }

    func test_SignUp_입력아이디가_6자이하이면_유효하지않다() throws {
        let id = "12345"
        let viewModel = SignUpViewModel()
        
        viewModel.status.buttonEnabled.bind({ id, password, passwordvalid, nickname in
            XCTAssertFalse(id)
        })
        
        viewModel.action.idTextFieldChanged(id)
    }

    func test_SignUp_입력아이디가_16자초과이면_유효하지않다() throws {
        let id = "12345123451234512"
        let viewModel = SignUpViewModel()
        
        viewModel.status.buttonEnabled.bind({ id, password, passwordvalid, nickname in
            XCTAssertFalse(id)
        })
        
        viewModel.action.idTextFieldChanged(id)

    }

    func test_SignUp_입력아이디가_6자이상_16자이하이면_유효하다() throws {
        let id = "123456"
        let viewModel = SignUpViewModel()
        
        viewModel.status.buttonEnabled.bind({ id, password, passwordvalid, nickname in
            XCTAssertTrue(id)
        })
        
        viewModel.action.idTextFieldChanged(id)

    }
            
    func test_SignUp_입력비밀번호가_6자미만이면_유효하지않다() throws {
        let password = "12345"
        let viewModel = SignUpViewModel()
        
        viewModel.status.buttonEnabled.bind({ id, password, passwordvalid, nickname in
            XCTAssertFalse(password)
        })
        
        viewModel.action.passwordTextFieldChanged(password)

    }

    func test_SignUp_입력비밀번호가_12자초과이면_유효하지않다() throws {
        let password = "1234512345123"
        let viewModel = SignUpViewModel()
        
        viewModel.status.buttonEnabled.bind({ id, password, passwordvalid, nickname in
            XCTAssertFalse(password)
        })
        
        viewModel.action.passwordTextFieldChanged(password)

    }

    func test_SignUp_입력비밀번호에_특수문자가_없으면_유효하지않다() throws {
        let password = "12345abc"
        let viewModel = SignUpViewModel()
        
        viewModel.status.buttonEnabled.bind({ id, password, passwordvalid, nickname in
            XCTAssertFalse(password)
        })
        
        viewModel.action.passwordTextFieldChanged(password)
    }

    func test_SignUp_입력비밀번호에_알파벳이_없으면_유효하지않다() throws {
        let password = "12345!@#"
        let viewModel = SignUpViewModel()
        
        viewModel.status.buttonEnabled.bind({ id, password, passwordvalid, nickname in
            XCTAssertFalse(password)
        })
        
        viewModel.action.passwordTextFieldChanged(password)
    }

    func test_SignUp_입력비밀번호에_영문_특수문자_숫자가_1자이상_존재하면_유효하다() throws {
        let password = "1!2@3abc"
        let viewModel = SignUpViewModel()

        viewModel.status.buttonEnabled.bind({ id, password, passwordvalid, nickname in
            XCTAssertTrue(password)
        })

        viewModel.action.passwordTextFieldChanged(password)
    }
    
    func test_SignUp_입력비밀번호와_비밀번호_확인이_같지않으면_유효하지않다() throws {
        let password = "1!2@3abc"
        let passwordConfirm = "1!2@3abcd"

        let viewModel = SignUpViewModel()

        viewModel.status.buttonEnabled.bind({ id, password, passwordConfirm, nickname in
            XCTAssertFalse(passwordConfirm)
        })

        viewModel.action.passwordTextFieldChanged(password)
        viewModel.action.passwordConfirmFieldChanged(password, passwordConfirm)
    }

    func test_SignUp_입력비밀번호와_비밀번호_확인이_같으면_유효하다() throws {
        let password = "1!2@3abc"
        let passwordConfirm = "1!2@3abc"
        let viewModel = SignUpViewModel()

        viewModel.status.buttonEnabled.bind({ id, password, passwordConfirm, nickname in
            XCTAssertTrue(passwordConfirm)
        })
        
        viewModel.action.passwordConfirmFieldChanged(password, passwordConfirm)
    }
    
    func test_SignUp_입력닉네임이_6자이하이면_유효하지않다() throws {
        let nickname = "12345"
        let viewModel = SignUpViewModel()
        
        viewModel.status.buttonEnabled.bind({ id, password, passwordvalid, nickname in
            XCTAssertFalse(nickname)
        })
        
        viewModel.action.nicknameFieldChanged(nickname)
    }

    func test_SignUp_입력닉네임이_16자초과이면_유효하지않다() throws {
        let nickname = "12345123451234512"
        let viewModel = SignUpViewModel()
        
        viewModel.status.buttonEnabled.bind({ id, password, passwordvalid, nickname in
            XCTAssertFalse(nickname)
        })
        
        viewModel.action.nicknameFieldChanged(nickname)

    }

    func test_SignUp_입력닉네임이_6자이상_16자이하이면_유효하다() throws {
        let nickname = "a123456"
        let viewModel = SignUpViewModel()
        
        viewModel.status.buttonEnabled.bind({ id, password, passwordvalid, nickname in
            XCTAssertTrue(nickname)
        })
        
        viewModel.action.nicknameFieldChanged(nickname)
    }
    
}


