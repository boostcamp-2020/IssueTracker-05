//
//  SignInViewController.swift
//  IssueTracker
//
//  Created by cho on 2020/10/29.
//  Copyright © 2020 ralph. All rights reserved.
//


import UIKit
import AuthenticationServices

class SignInViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var idValidMessageLabel: UILabel!
    @IBOutlet weak var passwordValidMessageLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signInGithubButton: UIButton!
    @IBOutlet weak var signInAppleButton: ASAuthorizationAppleIDButton!
    
    @IBOutlet weak var idErrorMessageLabel: UILabel!
    @IBOutlet weak var passwordErrorMessageLabel: UILabel!
    
    let viewModel = SignInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        idTextField.delegate = self
        passwordTextField.delegate = self
        viewModel.status.idErrorMessage.bind(idErrorLabelUpdate)
        viewModel.status.passwordErrorMessage.bind(passwordErrorLabelUpdate)
        viewModel.status.buttonEnabled.bindAndFire(buttonEnabledCheck)
    }
    
    func buttonEnabledCheck(idEnable: Bool, passwordEnable: Bool) {
        if idEnable, passwordEnable {
            self.loginButton.isUserInteractionEnabled = true
            self.loginButton.alpha = 1.0
        } else {
            self.loginButton.isUserInteractionEnabled = false
            self.loginButton.alpha = 0.3
        }
    }
    
    func idErrorLabelUpdate(id:String) {
        // view update
        if id.isEmpty {
            self.idErrorMessageLabel.isHidden = true
        } else {
            self.idErrorMessageLabel.text = id
            self.idErrorMessageLabel.isHidden = false
        }
    }
    
    func passwordErrorLabelUpdate(password:String) {
        // view update
        if password.isEmpty {
            self.passwordErrorMessageLabel.isHidden = true
        } else {
            self.passwordErrorMessageLabel.text = password
            self.passwordErrorMessageLabel.isHidden = false
        }
    }
    
    
    func setUI() {
        
        idTextField.setLabel("아이디")
        passwordTextField.setLabel("비밀번호")
        
    }

    func requestCode() {
        let scope = "repo,user"
        let client_id = "0da3b116126e34da88f8"
        let urlString = "https://github.com/login/oauth/authorize?client_id=\(client_id)&scope=\(scope)"
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func touchedSignInWithGithub(_ sender: Any) {
        LoginManager.shared.requestCode()
        LoginManager.shared.getUser()
    }
    
    @IBAction func touchedSignIinWithApple(_ sender: Any) {
        
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self as? ASAuthorizationControllerDelegate
        controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
        controller.performRequests()
        
    }
    
}

extension SignInViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let user = credential.user
            print("User: \(user)")
            guard let email = credential.email else { return }
            print("Email: \(email)")
        }
    }
    
}

extension UITextField {
    func setLabel(_ text: String) {
        
        let label = UILabel(frame: CGRect(x: 30, y: 5, width: 10, height: 10))
        label.text = text
        label.font = UIFont(name: label.font.fontName, size: 14)
        label.textAlignment = .right
        label.widthAnchor.constraint(equalToConstant: 60).isActive = true
        leftView = label
        leftViewMode = .always
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        viewModel.action.idTextFieldChanged(self.idTextField.text!)
        viewModel.action.passwordTextFieldChanged(self.passwordTextField.text!)
    }
}

