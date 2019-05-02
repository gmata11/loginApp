//
//  SignupController.swift
//  LoginSignup
//
//  Created by Gerard Mata Carrera on 26/01/2019.
//  Copyright © 2019 Gerard Mata Carrera. All rights reserved.
//

import UIKit
import Firebase

class SignupController: UIViewController {
    
    
    let emailTextFieldRegister: UITextField = {
        let e = UITextField()
        e.placeholder = "Email"
        e.textColor = .white
        e.setBottomBorder(backGroundColor: BLUE_THEME, borderColor: .white)
        return e
    }()
    
    let passwordTextFieldRegister: UITextField = {
        let p = UITextField()
        p.placeholder = "Password"
        p.textColor = .white
        p.isSecureTextEntry = true
        p.setBottomBorder(backGroundColor: BLUE_THEME, borderColor: .white)
        return p
    }()
    
    let registerButton: UIButton = {
        let l = UIButton(type: .system)
        l.setTitleColor(.white, for: .normal)
        l.setTitle("Register", for: .normal)
        l.layer.cornerRadius = 10
        l.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        l.backgroundColor = UIColor.rgb(r: 20, g: 240, b: 240)
        return l
    }()
    
    
    let haveAccountButton: UIButton = {
        let h = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        h.setAttributedTitle(attributedTitle, for: .normal)
        
        attributedTitle.append(NSAttributedString(string: "Sign In", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black]))
        h.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        
        return h
    }()
    
    
    
    override func viewDidLoad() {
        
        let ref = Database.database().reference(fromURL: "https://mata-a3c06.firebaseio.com")
        ref.updateChildValues(["laia" : 123123])
        super.viewDidLoad()
        view.backgroundColor = BLUE_THEME
        
        setupTextFieldComponentsRegister()
        setupRegisterButton()
        setupHaveAccountButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    fileprivate func setupTextFieldComponentsRegister() {
        setupEmailFieldRegister()
        setupPasswordFieldRegister()
    }
    
    @objc func signInAction(){
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @objc func handleRegister(){
        Auth.auth().createUser(withEmail: emailTextFieldRegister.text!, password: passwordTextFieldRegister.text! ) { (user, error) in
            print ("user added")
            if error != nil {
                print("error")
            }
            
        }
    }
    
    fileprivate func setupEmailFieldRegister() {
        view.addSubview(emailTextFieldRegister)
        emailTextFieldRegister.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldRegister.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emailTextFieldRegister.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailTextFieldRegister.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        emailTextFieldRegister.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    fileprivate func setupPasswordFieldRegister() {
        view.addSubview(passwordTextFieldRegister)
        passwordTextFieldRegister.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldRegister.topAnchor.constraint(equalTo: emailTextFieldRegister.bottomAnchor, constant: 8).isActive = true
        passwordTextFieldRegister.leftAnchor.constraint(equalTo: emailTextFieldRegister.leftAnchor, constant: 0).isActive = true
        passwordTextFieldRegister.rightAnchor.constraint(equalTo: emailTextFieldRegister.rightAnchor, constant: 0).isActive = true
        passwordTextFieldRegister.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    fileprivate func setupRegisterButton() {
        view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.topAnchor.constraint(equalTo: passwordTextFieldRegister.bottomAnchor, constant: 20).isActive = true
        registerButton.leftAnchor.constraint(equalToSystemSpacingAfter: passwordTextFieldRegister.leftAnchor, multiplier: 0).isActive = true
        registerButton.rightAnchor.constraint(equalToSystemSpacingAfter: passwordTextFieldRegister.rightAnchor, multiplier: 0).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    fileprivate func setupHaveAccountButton(){
        view.addSubview(haveAccountButton)
        haveAccountButton.translatesAutoresizingMaskIntoConstraints = false
        haveAccountButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        haveAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        haveAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        haveAccountButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
