//
//  SignUpViewController.swift
//  IssueTracker
//
//  Created by cho on 2020/11/02.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var idErrorMessageLabel: UILabel!
    @IBOutlet weak var passwordErrorMessageLabel: UILabel!
    @IBOutlet weak var passwordConfirmErrorMessageLabel: UILabel!
    @IBOutlet weak var nickNameErrorMessageLabel: UILabel!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet var signUpButtonConstraint: NSLayoutConstraint!
    var viewModel = SignUpViewModel()
    
    var didSendEventClosure: ((SignUpViewController.Event) -> Void)?
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        idTextField.delegate = self
        passwordTextField.delegate = self
        passwordConfirmTextField.delegate = self
        nickNameTextField.delegate = self
        setUI()
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setUI() {
        idTextField.setLabel("아이디")
        passwordTextField.setLabel("비밀번호")
        passwordConfirmTextField.setLabel("비밀번호 확인")
        nickNameTextField.setLabel("닉네임")
        self.navigationItem.leftBarButtonItem =
            UIBarButtonItem(title: "back", style: .done, target: self, action: #selector(tabbedbackButton))
        addKeyboardNotification()
    }
    
    @objc func tabbedbackButton() {
        didSendEventClosure?(Event.back)
    }
    
    func bindUI() {
        viewModel.status.idErrorMessage.bind(idErrorLabelUpdate)
        viewModel.status.passwordErrorMessage.bind(passwordErrorLabelUpdate)
        viewModel.status.passwordConfirmErrorMessage.bind(passwordConfirmLabelUpdate)
        viewModel.status.nicknameErrorMessage.bind(nicknameConfirmLabelUpdate)
        viewModel.status.buttonEnabled.bindAndFire(buttonEnabledCheck)
        
    }
    
    func buttonEnabledCheck(idEnable: Bool, passwordEnable: Bool, passwordConfirmEnable: Bool, nicknameEnable: Bool) {
        if idEnable, passwordEnable, passwordConfirmEnable, nicknameEnable {
            self.signUpButton.isUserInteractionEnabled = true
            self.signUpButton.alpha = 1.0
        } else {
            self.signUpButton.isUserInteractionEnabled = false
            self.signUpButton.alpha = 0.3
        }
    }
    
    
    func nicknameConfirmLabelUpdate(nickname: String) {
        if nickname.isEmpty {
            self.nickNameErrorMessageLabel.isHidden = true
        } else {
            self.nickNameErrorMessageLabel.text = nickname
            self.nickNameErrorMessageLabel.isHidden = false
        }
    }
    
    func passwordConfirmLabelUpdate(passwordConfirm: String) {
        if passwordConfirm.isEmpty {
            self.passwordConfirmErrorMessageLabel.isHidden = true
        } else {
            self.passwordConfirmErrorMessageLabel.text = passwordConfirm
            self.passwordConfirmErrorMessageLabel.isHidden = false
        }
    }
    
    
    func idErrorLabelUpdate(id: String) {
        if id.isEmpty {
            self.idErrorMessageLabel.isHidden = true
        } else {
            self.idErrorMessageLabel.text = id
            self.idErrorMessageLabel.isHidden = false
        }
    }
    
    func passwordErrorLabelUpdate(password: String) {
        if password.isEmpty {
            self.passwordErrorMessageLabel.isHidden = true
        } else {
            self.passwordErrorMessageLabel.text = password
            self.passwordErrorMessageLabel.isHidden = false
        }
    }

    @IBAction func touchedSignUp(_ sender: Any) {
        
        guard let userId = self.idTextField.text, let password = self.passwordTextField.text, let nickname = self.nickNameTextField.text else { return }
        
        LoginManager.shared.requestSignUpPost(userId: userId, password: password, nickname: nickname) { success in
            if success {
                self.didSendEventClosure?(Event.signUp)
            } else {
//                self.showToast(message: "회원 가입에 실패했습니다.")
                Toast.shared.showToast(message: "회원 가입에 실패했습니다.", view: self.view)
            }
        }
    }
    
}

extension SignUpViewController {
    
    private func addKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybaordRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keybaordRectangle.height
            signUpButtonConstraint.constant = 50
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybaordRectangle = keyboardFrame.cgRectValue
            signUpButtonConstraint.constant = 100
        }
    }
    
}



extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        viewModel.action.idTextFieldChanged(self.idTextField.text!)
        viewModel.action.passwordTextFieldChanged(self.passwordTextField.text!)
        viewModel.action.passwordConfirmFieldChanged(self.passwordTextField.text!, self.passwordConfirmTextField.text!)
        viewModel.action.nicknameFieldChanged(self.nickNameTextField.text!)
    }    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        signUpButton.sendActions(for: .touchUpInside)
        return true
    }
}

extension SignUpViewController {
    enum Event {
        case signUp, back
    }
}
