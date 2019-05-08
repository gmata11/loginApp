//
//  EnrolledUser.swift
//  LoginSignup
//
//  Created by Gerard Mata Carrera on 28/01/2019.
//  Copyright © 2019 Gerard Mata Carrera. All rights reserved.
//

import UIKit
import SkeletonView

class EnrolledUser:UIViewController {
    
//    @IBOutlet var textUser: UILabel!
//    var myCustomViewController: LoginController = LoginController(nibName: nil, bundle: nil)
    
    
    
    let logOutButton: UIButton = {
        
        let h = UIButton(type: .system)
            h.setTitle("LogOut", for: .normal)
            h.setTitleColor(.white, for: .normal)
        h.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return h
    }()
    
    let loadPage: UIImageView = {
        let l = UIImageView()
            l.isSkeletonable = true
        return l
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BLUE_THEME
//        textUser.text = myCustomViewController.user
//        print (textUser)
        setupLogoutButton()
        setupLoadPage()
        view.showAnimatedSkeleton()
    }
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    
    fileprivate func setupLogoutButton(){
        view.addSubview(logOutButton)
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.bottomAnchor.constraint(equalTo: view.topAnchor , constant: 150).isActive = true
        logOutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    fileprivate func setupLoadPage(){
        view.addSubview(loadPage)
        loadPage.translatesAutoresizingMaskIntoConstraints = false
        loadPage.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        loadPage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        loadPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        loadPage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    
    
}//EndEnrolledUser
