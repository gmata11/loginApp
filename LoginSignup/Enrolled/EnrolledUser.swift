//
//  EnrolledUser.swift
//  LoginSignup
//
//  Created by Gerard Mata Carrera on 28/01/2019.
//  Copyright © 2019 Gerard Mata Carrera. All rights reserved.
//

import UIKit

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BLUE_THEME
//        textUser.text = myCustomViewController.user
//        print (textUser)
//        setupLogoutButton()
        configurationNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func configurationNavigationBar(){
        navigationController?.navigationBar.barTintColor = BLUE_THEME
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "MATA"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
        
    }
    
    @objc func handleMenuToggle(){
        print("test")
    }
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    
//    fileprivate func setupLogoutButton(){
//        view.addSubview(logOutButton)
//        logOutButton.translatesAutoresizingMaskIntoConstraints = false
//        logOutButton.bottomAnchor.constraint(equalTo: view.topAnchor , constant: 150).isActive = true
//        logOutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
//        logOutButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
//    }
    
    
    
}//EndEnrolledUser
