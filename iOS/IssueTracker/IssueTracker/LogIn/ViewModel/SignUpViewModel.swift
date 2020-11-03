//
//  SignUpViewModel.swift
//  IssueTracker
//
//  Created by cho on 2020/11/03.
//  Copyright © 2020 ralph. All rights reserved.
//

import Foundation

class SignUpViewModel {
    
    struct Status {
        var idErrorMessage = Bindable<String>("")
        var passwordErrorMessage = Bindable<String>("")
        var passwordConfirmErrorMessage = Bindable<String>("")
        var nicknameErrorMessage = Bindable<String>("")
        var buttonEnabled = Bindable((false,false,false,false))
    }
    
    struct Action {
        var idTextFieldChanged: (String) -> Void
        var passwordTextFieldChanged: (String) -> Void
        var passwordConfirmFieldChanged: (String, String) -> Void
        var nicknameFieldChanged: (String) -> Void
    }
    
    var status = Status()
    lazy var action = Action(idTextFieldChanged: idValidationChecker, passwordTextFieldChanged: passwordValidationChecker, passwordConfirmFieldChanged: passwordConfirmValidationChecker, nicknameFieldChanged: nickNameValidationChecker)

    var idValidationChecker = IdValidationChecker()
    var passwordValidationChecker = PasswordValidationChecker()
    var nicknameValidationChecker = NicknameValidationChecker()
    
    func idValidationChecker(text:String) {
        self.status.idErrorMessage.value = idValidationChecker.validate(input: text).rawValue
        self.status.buttonEnabled.value.0 = idValidationChecker.validate(input: text).rawValue.isEmpty && !text.isEmpty
    }
 
    func passwordValidationChecker(text:String) {
        self.status.passwordErrorMessage.value = passwordValidationChecker.validate(input: text).rawValue
        self.status.buttonEnabled.value.1 = passwordValidationChecker.validate(input: text).rawValue.isEmpty && !text.isEmpty
    }
    
    func passwordConfirmValidationChecker(password: String, passwordConfirm: String) {
        self.status.passwordConfirmErrorMessage.value = (password == passwordConfirm) || passwordConfirm.isEmpty ? "" : "입력한 비밀번호와 다릅니다"
        self.status.buttonEnabled.value.2 = self.status.passwordConfirmErrorMessage.value.isEmpty && !passwordConfirm.isEmpty
    }
    
    func nickNameValidationChecker(text:String) {
        self.status.nicknameErrorMessage.value = nicknameValidationChecker.validate(input: text).rawValue
        self.status.buttonEnabled.value.3 = nicknameValidationChecker.validate(input: text).rawValue.isEmpty && !text.isEmpty
    }
    
    
    init() {
        
    }
    
}
