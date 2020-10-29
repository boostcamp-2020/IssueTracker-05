//
//  SignInViewController.swift
//  IssueTracker
//
//  Created by cho on 2020/10/29.
//  Copyright © 2020 ralph. All rights reserved.
//


import RxCocoa
import RxSwift
import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        
        idTextField.setLabel("아이디")
        passwordTextField.setLabel("비밀번호")
    }
    

}

extension UITextField {
    func setLabel(_ text: String) {
        
        let label = UILabel(frame: CGRect(x: 10, y: 5, width: 10, height: 10))
        label.text = text
        label.font = UIFont(name: label.font.fontName, size: 14)
        leftView = label
        leftViewMode = .always
        
    }
}

