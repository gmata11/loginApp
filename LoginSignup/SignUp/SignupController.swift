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
    
    
    // -- CREATING COMPONENTS -- 
    
    let emailTextFieldRegister: UITextField = {
        let e = UITextField()
        e.placeholder = "Email"
        e.textColor = .white
        e.clearButtonMode = .always
        e.setBottomBorder(backGroundColor: BLUE_THEME, borderColor: .white)
        return e
    }()
    
    let passwordTextFieldRegister: UITextField = {
        let p = UITextField()
        p.placeholder = "Password"
        p.textColor = .white
        p.isSecureTextEntry = true
        p.clearButtonMode = .always
        p.setBottomBorder(backGroundColor: BLUE_THEME, borderColor: .white)
        return p
    }()
    
    let repeatPasswordTextFieldRegister: UITextField = {
        let p = UITextField()
        p.placeholder = "Repeat Password"
        p.textColor = .white
        p.isSecureTextEntry = true
        p.clearButtonMode = .always
        p.setBottomBorder(backGroundColor: BLUE_THEME, borderColor: .white)
        return p
    }()
    
    
    
    let dateTextFieldRegister: UITextField = {
        
        //Adding minimum & maximum date for the date picker
        let calendar = Calendar(identifier: .gregorian)
        var comps = DateComponents()
        comps.year = 0
        let maxDate = calendar.date(byAdding: comps, to: Date())
        comps.year = -90
        let minDate = calendar.date(byAdding: comps, to: Date())
        
        let datePickerTextfieldRegister : UIDatePicker = {
            let d = UIDatePicker()
            d.datePickerMode = .date
            d.maximumDate = maxDate
            d.minimumDate = minDate
            d.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
            return d
        }()
        
        //Adding the dataPicker component to the the textField
        let d = UITextField()
        d.placeholder = "Date"
        d.textColor = .white
        d.clearButtonMode = .always
        d.inputView = datePickerTextfieldRegister
        d.setBottomBorder(backGroundColor: BLUE_THEME, borderColor: .white)
        return d
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
    
    
    // -- FINAL CREATING COMPONENTS --
    
    
    override func viewDidLoad() {
        
        let ref = Database.database().reference(fromURL: "https://mata-a3c06.firebaseio.com")
        ref.updateChildValues(["laia" : 123123])
        super.viewDidLoad()
        view.backgroundColor = BLUE_THEME
        self.hideKeyboard()
        
        setupTextFieldComponentsRegister()
        setupRegisterButton()
        setupHaveAccountButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateTextFieldRegister.text = dateFormatter.string(from: datePicker.date)
    }
    
    
    @objc func signInAction(){
        navigationController?.popViewController(animated: true)
    }
    
    
    //Treure el teclat
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    //Treure el teclat
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @objc func handleRegister(){
        Auth.auth().createUser(withEmail: emailTextFieldRegister.text!, password: passwordTextFieldRegister.text! ) { (user, error) in
            print ("user added")
            if error != nil {
                print("error")
            }
            
        }
    }
    
    // -- ADDING COMPONENTS TO THE VIEW --
    
    fileprivate func setupTextFieldComponentsRegister() {
        setupEmailFieldRegister()
        setupPasswordFieldRegister()
        setupRepeatPasswordFieldRegister()
        setupDateTextField()
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
    
    fileprivate func setupRepeatPasswordFieldRegister() {
        view.addSubview(repeatPasswordTextFieldRegister)
        repeatPasswordTextFieldRegister.translatesAutoresizingMaskIntoConstraints = false
        repeatPasswordTextFieldRegister.topAnchor.constraint(equalTo: passwordTextFieldRegister.bottomAnchor, constant: 8).isActive = true
        repeatPasswordTextFieldRegister.leftAnchor.constraint(equalTo: passwordTextFieldRegister.leftAnchor, constant: 0).isActive = true
        repeatPasswordTextFieldRegister.rightAnchor.constraint(equalTo: passwordTextFieldRegister.rightAnchor, constant: 0).isActive = true
        repeatPasswordTextFieldRegister.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    fileprivate func setupDateTextField(){
        view.addSubview(dateTextFieldRegister)
        dateTextFieldRegister.translatesAutoresizingMaskIntoConstraints = false
        dateTextFieldRegister.topAnchor.constraint(equalTo: repeatPasswordTextFieldRegister.bottomAnchor, constant: 8).isActive = true
        dateTextFieldRegister.leftAnchor.constraint(equalTo: repeatPasswordTextFieldRegister.leftAnchor, constant: 0).isActive = true
        dateTextFieldRegister.rightAnchor.constraint(equalTo: repeatPasswordTextFieldRegister.rightAnchor, constant: 0).isActive = true
        dateTextFieldRegister.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    fileprivate func setupRegisterButton() {
        view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.topAnchor.constraint(equalTo: dateTextFieldRegister.bottomAnchor, constant: 30).isActive = true
        registerButton.leftAnchor.constraint(equalToSystemSpacingAfter: dateTextFieldRegister.leftAnchor, multiplier: 0).isActive = true
        registerButton.rightAnchor.constraint(equalToSystemSpacingAfter: dateTextFieldRegister.rightAnchor, multiplier: 0).isActive = true
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
    
    // -- FINAL ADDING COMPONENTS TO THE VIEW --
    
}//Final SignupController
