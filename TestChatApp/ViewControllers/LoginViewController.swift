//
//  ViewController.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit
import FirebaseFirestore

class LoginViewController: BaseViewController {
    
    var loginLabel: AppLabel = {
        let label = AppLabel()
        label.text = "Login"
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
        super.viewDidLoad()
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
        addUser {
            let vc = BaseTabBarViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    /// Permission needs to be updated to allow me write to this collection or be given the correct collection reference to do so.
    func addUser(completion: @escaping () -> Void){
        print("text \(usernameTextField.text)")
        guard let username = usernameTextField.text?.trimmingCharacters(in: .whitespaces) else {
            return
        }
        if username == "" {
            print("no name in field yet")
            let alert = UIAlertController(title: "Alert", message: "Please input a username first!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        } else {
            // Write Data to Firestore
            let collection = Firestore.firestore().collection("users")
            let user = UserModel(
                userId: "JfpBYheu4zLhNMv539OR",
                name: "Brooklyn Simmons",
                bio: "Always curious to learn new stuffs",
                username: username,
                photo: "https://firebasestorage.googleapis.com/v0/b/blynq-13e9a.appspot.com/o/default_user_img.png?alt=media&token=8190d4c3-8a93-4476-a37b-bc3faa74e71d"
            )
            print(user.dictionary)
            DispatchQueue.main.async {
                collection.addDocument(data: user.dictionary) { err in
                    print("see err \(String(describing: err))")
                    let alert = UIAlertController(title: "Alert", message: err?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in
                        print("okay pressed")
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                completion()
            }
            
        }
    }
    
    func fetchAllUsers() {
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({ (document) in
                let dictionary = document.data()
                print("see the dict \(dictionary)")
            })
            print("error is \(String(describing: error))")
        }
    }
}
