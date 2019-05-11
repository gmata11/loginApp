//
//  ViewController.swift
//  LoginSignup
//
//  Created by Gerard Mata Carrera on 25/01/2019.
//  Copyright © 2019 Gerard Mata Carrera. All rights reserved.
//

import UIKit



class LoginController: UIViewController {
    
//    var user: String = ""
    
    let logo: UIImageView = {
        let l = UIImageView()
            l.image = UIImage(named: "mata")
            l.contentMode = .scaleAspectFill
            l.layer.masksToBounds = true
        return l
    }()
    
    
    let emailTextField: UITextField = {
        let e = UITextField()
            e.placeholder = "Email"
            e.textColor = .white
            e.clearButtonMode = .always
            //e.clearButtonMode = .whileEditing
            e.setBottomBorder(backGroundColor: BLUE_THEME, borderColor: .white)
        return e
    }()
    
    let passwordTextField: UITextField = {
        let p = UITextField()
            p.placeholder = "Password"
            p.textColor = .white
            p.isSecureTextEntry = true
            p.clearButtonMode = .always
            p.setBottomBorder(backGroundColor: BLUE_THEME, borderColor: .white)
        return p
    }()
    
    let loginButton: UIButton = {
        let l = UIButton(type: .system)
            l.setTitleColor(.white, for: .normal)
            l.setTitle("Log in", for: .normal)
            l.layer.cornerRadius = 10
        l.addTarget(self, action: #selector(loginMessage), for: .touchUpInside)
        l.backgroundColor = UIColor.rgb(r: 20, g: 240, b: 240)
        return l
    }()
    
    let forgotPasword: UIButton = {
        let f = UIButton(type: .system)
            f.setTitle("Forgot Password?", for: .normal)
            f.setTitleColor(.white, for: .normal)
        f.addTarget(self, action: #selector(forgotPassAction), for: .touchUpInside)
        return f
    }()
    
    let haveAccountButton: UIButton = {
        let h = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
            h.setAttributedTitle(attributedTitle, for: .normal)
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black]))
        h.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        
        return h
    }()
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.backgroundColor = BLUE_THEME
        
        navigationController?.isNavigationBarHidden = true
        
        self.hideKeyboard()
        
        setupLogo()
        setupTextFieldComponents()
        setupLoginButton()
        setupForgotPassword()
        setupAccountButton()
    }//end viewDidLoad
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    

    


    fileprivate func setupTextFieldComponents() {
        setupEmailField()
        setupPasswordField()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    fileprivate func setupLogo(){
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        logo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        logo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    fileprivate func setupEmailField() {
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    fileprivate func setupPasswordField() {
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: 0).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: 0).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
    
    fileprivate func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        loginButton.leftAnchor.constraint(equalToSystemSpacingAfter: passwordTextField.leftAnchor, multiplier: 0).isActive = true
        loginButton.rightAnchor.constraint(equalToSystemSpacingAfter: passwordTextField.rightAnchor, multiplier: 0).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    fileprivate func setupForgotPassword() {
        view.addSubview(forgotPasword)
        forgotPasword.translatesAutoresizingMaskIntoConstraints = false
        forgotPasword.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 8).isActive = true
        forgotPasword.leftAnchor.constraint(equalTo: loginButton.leftAnchor, constant: 0).isActive = true
        forgotPasword.rightAnchor.constraint(equalTo: loginButton.rightAnchor, constant: 0).isActive = true
        forgotPasword.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
    }
    
    fileprivate func setupAccountButton() {
        view.addSubview(haveAccountButton)
        haveAccountButton.translatesAutoresizingMaskIntoConstraints = false
        haveAccountButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        haveAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        haveAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        haveAccountButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    @objc func signupAction() {
        let signupcontroller = SignupController()
        navigationController?.pushViewController(signupcontroller, animated: true)
    }
    
    @objc func forgotPassAction() {
        let forgotPassController = ForgotPassword()
        navigationController?.pushViewController(forgotPassController, animated: true)
    }
    
    @IBAction func loginMessage() {
        let alert = UIAlertController(title: "Error", message: "The textfield or textfields are empty. Please try it again.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        let wrong_user = UIAlertController(title: "Wrong user", message: "The user is not recognized. Please try it again.", preferredStyle: .alert)
        let welcome = UIAlertController(title: "Welcome", message: "Hi Gerard", preferredStyle: .alert)

        welcome.addAction(action)
        alert.addAction(action)
        wrong_user.addAction(action)
        
        if(emailTextField.text?.isEmpty ?? true || passwordTextField.text?.isEmpty ?? true){
            return present(alert,animated: true,completion: nil)
        }else{
            if(emailTextField.text?.elementsEqual("G") ?? true && passwordTextField.text?.elementsEqual("1234") ?? true){
//                user = emailTextField.text!
                
                let enrolledUser = EnrolledUser()
                navigationController?.pushViewController(enrolledUser, animated: true)
                present(welcome,animated: true)
//                print(user)
            }else{
                return present(wrong_user,animated: true,completion: nil)
            }
        }
    }

}

