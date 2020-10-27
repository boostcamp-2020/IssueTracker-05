//
//  ViewController.swift
//  IssueTracker
//
//  Created by 조정래 on 2020/10/27.
//  Copyright © 2020 ralph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

#if DEBUG

import SwiftUI

struct Preview: PreviewProvider {
    
    static var previews: some View {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: String(describing: ViewController.self))
        
        return vc.view.liveView
    }
    
}

#endif
