//
//  ValidationChecker.swift
//  IssueTracker
//
//  Created by cho on 2020/10/28.
//  Copyright © 2020 ralph. All rights reserved.
//

import Foundation

protocol Validator {
    var pass: validateMessage { get }
    
    func validate(input: String) -> validateMessage
}

enum validateMessage: String {
    case invalidIdlength = "아이디는 6~16자만 입력 가능합니다"
    case invalidIdFormat = "아이디는 영문과 숫자로만 적어주셔야 합니다."
    case invalidPwlength = "비밀번호는 6~12자만 입력 가능합니다"
    case invalidNickname = "닉네임은 6~16자만 입력 가능합니다"
    case invalidNicknameFormat = "닉네임은 영문과 숫자로만 적어주셔야 합니다."
    case invalidPwSpecial = "비밀번호는 반드시 특수문자를 포함해야 합니다"
    case invalidPwNumber = "비밀번호는 반드시 숫자를 포함해야 합니다"
    case invalidPwAlpha = "비밀번호는 반드시 영문자를 포함해야 합니다"
    case emptyId = "아이디를 입력하세요"
    case emptyPassword = "비밀번호를 입력하세요"
    case valid = ""
}

class IdValidationChecker: Validator {
    
    var pass: validateMessage {
        get { .valid }
    }

    func validate(input: String) -> validateMessage {
        if input.isEmpty {
            return .valid
        }
        
        if idFormatCheck(input: input) {
            return .invalidIdFormat
        }
        
        if input.count < 6 || input.count > 16 {
            return .invalidIdlength
        }
        
        return .valid
    }
    
    func idFormatCheck(input: String) -> Bool {
        let specialCharacterRegEx = ".*[^0-9a-zA-Z]+.*"
        var textFilter = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
        return textFilter.evaluate(with: input)
    }
    
}

class PasswordValidationChecker: Validator {
    
    var pass: validateMessage {
        get { .valid }
    }
    
    func validate(input: String) -> validateMessage {
        if input.isEmpty {
            return .valid
        }
                
        if input.count < 6 || input.count > 12 {
            return .invalidPwlength
        }
        
        if !specialCheck(input: input) {
            return .invalidPwSpecial
        }
        
        if !numberCheck(input: input) {
            return .invalidPwNumber
        }
        
        if !alphabetCheck(input: input) {
            return .invalidPwAlpha
        }
        
        return .valid
    }
    
    func specialCheck(input: String) -> Bool {
        let specialCharacterRegEx = ".*[~!@#$%^&*()_+|<>?:{}]+.*"
        let textFilter = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
        return textFilter.evaluate(with: input)
    }
    
    func numberCheck(input: String) -> Bool {
        let numberRegEx  = ".*[0-9]+.*"
        let textFilter = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = textFilter.evaluate(with: input)
        return numberresult
    }
    
    func alphabetCheck(input: String) -> Bool {
        let alphaRegEx = ".*[a-zA-Z]+.*"
        let textFilter = NSPredicate(format:"SELF MATCHES %@", alphaRegEx)
        let alphaResult = textFilter.evaluate(with: input)
        return alphaResult
    }
    
}

class NicknameValidationChecker: Validator {
    
    var pass: validateMessage {
        get{ .valid }
    }
    
    func validate(input: String) -> validateMessage {
        if input.isEmpty {
            return .valid
        }
        
        if nicknameFormatCheck(input: input) {
            return .invalidNicknameFormat
        }
        
        if input.count < 6 || input.count > 12 {
            return .invalidNickname
        }
        return .valid
    }
    
    func nicknameFormatCheck(input: String) -> Bool {
        let specialCharacterRegEx = ".*[^0-9a-zA-Z]+.*"
        var textFilter = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
        return textFilter.evaluate(with: input)
    }
    
}
