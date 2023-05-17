//
//  ViewController.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginLabel: AppLabel = {
        let label = AppLabel()
        label.text = "Login "
        return label
    }()
    
    var instructionLabel: AppLabel = {
        let label = AppLabel()
        label.text = "Please enter your username to log in to your account"
        label.font = UIFont().useInterFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(hexString: "#A1A1A1")
        label.numberOfLines = 2
        return label
    }()
    
    var usernameLabel: AppLabel = {
        let label = AppLabel()
        label.text = "Username"
        label.font = UIFont().useInterFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    let usernameTextField: AppTextfield = {
        let textField = AppTextfield()
        return textField
    }()
    
    lazy var continueButton: AppButton = {
        let button = AppButton()
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewDidLoad()
        view.backgroundColor = .white
        activateConstraint()
    }
    
    private func activateConstraint() {
        view.addSubview(loginLabel)
        view.addSubview(instructionLabel)
        view.addSubview(usernameLabel)
        view.addSubview(usernameTextField)
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            
            instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            instructionLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            instructionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            
            usernameLabel.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 18),
            usernameLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 15),
            usernameTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            usernameTextField.heightAnchor.constraint(equalToConstant: 48),
            usernameTextField.trailingAnchor.constraint(equalTo: instructionLabel.trailingAnchor),
            
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            continueButton.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 32),
            continueButton.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: instructionLabel.trailingAnchor),
        ])
    }
    
    @objc func didTapLoginButton(){
        print("pressed")
    }
}
