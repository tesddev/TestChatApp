//
//  MessagingViewController.swift
//  TestChatApp
//
//  Created by Tes on 18/05/2023.
//

import UIKit

class MessagingViewController: BaseViewController {
    
    var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var avatar: AvatarImageView = {
        let imageView = AvatarImageView(frame: .zero)
        return imageView
    }()
    
    var nameLabel: AppLabel = {
        let label = AppLabel()
        label.text = "Smith Mathew"
        label.font = UIFont().useInterFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    let messageTextField: AppTextfield = {
        let textField = AppTextfield()
        textField.placeholder = "Send Message"
        textField.layer.cornerRadius = 28
        textField.layer.borderWidth = 0
        textField.backgroundColor = UIColor(hexString: "#F6F6F6")
        return textField
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "send"), for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        button.backgroundColor = UIColor(hexString: "#007665")
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateConstraint()
        self.tabBarController?.setTabBarHidden(true, animated: true)
    }
    
    private func activateConstraint() {
        view.addSubview(backButton)
        view.addSubview(avatar)
        view.addSubview(nameLabel)
        view.addSubview(messageTextField)
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 33),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            backButton.heightAnchor.constraint(equalToConstant: 14),
            backButton.widthAnchor.constraint(equalToConstant: 13),
            
            avatar.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 50),
            avatar.heightAnchor.constraint(equalToConstant: 50),
            avatar.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 12.45),
            
            nameLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
            
            messageTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -22),
            messageTextField.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            messageTextField.heightAnchor.constraint(equalToConstant: 50),
            messageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -74),
            
            sendButton.heightAnchor.constraint(equalToConstant: 50),
            sendButton.centerYAnchor.constraint(equalTo: messageTextField.centerYAnchor),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sendButton.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func didTapLoginButton(){
        self.add(NewChatViewController(), frame: self.view.bounds)
    }
    
    @objc func didTapBackButton(){
        self.navigationController?.popViewController(animated: true)
    }
}
