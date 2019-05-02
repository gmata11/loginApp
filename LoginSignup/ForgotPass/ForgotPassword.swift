//
//  ForgotPassword.swift
//  LoginSignup
//
//  Created by Gerard Mata Carrera on 01/05/2019.
//  Copyright © 2019 Gerard Mata Carrera. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class ForgotPassword: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BLUE_THEME
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
}//ForgotPassword
