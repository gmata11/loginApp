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
    
    let forgetPasswordTextView: UITextView = {
        let f = UITextView()
        f.textColor = .black
        f.backgroundColor = UIColor.rgb(r: 20, g: 240, b: 240)
        f.textAlignment = .center
        f.layer.cornerRadius = 10
        f.text = "Fill the fields to forget the password."
        f.font = .systemFont(ofSize: 16)
        f.sizeToFit()
        f.isScrollEnabled = false
        return f
    }()
    
    let emailTextFieldRegister: UITextField = {
        let e = UITextField()
        e.placeholder = "Email"
        e.textColor = .white
        e.clearButtonMode = .always
        e.setBottomBorder(backGroundColor: BLUE_THEME, borderColor: .white)
        return e
    }()
    

    let dateTextFieldRegister: UITextField = {
        
        let datePickerTextfieldRegister : UIDatePicker = {
            let d = UIDatePicker()
            d.datePickerMode = .date
            d.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
            return d
        }()
        
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
        l.setTitle("Send", for: .normal)
        l.layer.cornerRadius = 10
        l.backgroundColor = UIColor.rgb(r: 20, g: 240, b: 240)
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BLUE_THEME
        self.hideKeyboard()
        setupTextFieldComponentsRegister()
        setupRegisterButton()
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
    
    fileprivate func setupTextFieldComponentsRegister() {
        setupForgetPasswordTextView()
        setupEmailFieldRegister()
        setupDateTextField()
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
    
    fileprivate func setupForgetPasswordTextView(){
        view.addSubview(forgetPasswordTextView)
        forgetPasswordTextView.translatesAutoresizingMaskIntoConstraints = false
        forgetPasswordTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        forgetPasswordTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        forgetPasswordTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
    }
    
    
    
    fileprivate func setupEmailFieldRegister() {
        view.addSubview(emailTextFieldRegister)
        emailTextFieldRegister.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldRegister.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emailTextFieldRegister.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailTextFieldRegister.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        emailTextFieldRegister.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
    fileprivate func setupDateTextField(){
        view.addSubview(dateTextFieldRegister)
        dateTextFieldRegister.translatesAutoresizingMaskIntoConstraints = false
        dateTextFieldRegister.topAnchor.constraint(equalTo: emailTextFieldRegister.bottomAnchor, constant: 8).isActive = true
        dateTextFieldRegister.leftAnchor.constraint(equalTo: emailTextFieldRegister.leftAnchor, constant: 0).isActive = true
        dateTextFieldRegister.rightAnchor.constraint(equalTo: emailTextFieldRegister.rightAnchor, constant: 0).isActive = true
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
    
}//ForgotPassword
