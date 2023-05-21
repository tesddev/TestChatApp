//
//  NewChatViewController.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit
import FirebaseFirestore

class NewChatViewController: BaseViewController {
    var startChatCompletion: ((String)->Void)?
    
    private let parentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bigView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancelInCircle"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let headerLabel: AppLabel = {
        let label = AppLabel()
        label.text = "Recipient’s username"
        label.font = UIFont().useInterFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    let usernameTextField: AppTextfield = {
        let textField = AppTextfield()
        return textField
    }()
    
    lazy var continueButton: AppButton = {
        let button = AppButton()
        button.setTitle("Start chat", for: .normal)
        button.addTarget(self, action: #selector(didTapStartChatButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        activateConstraint()
        let dismissScreen = UITapGestureRecognizer(target: self, action: #selector(didTapDismissButton))
        parentView.addGestureRecognizer(dismissScreen)
    }
    
    private func activateConstraint() {
        view.addSubview(parentView)
        view.addSubview(bigView)
        parentView.addSubview(backButton)
        bigView.addSubview(headerLabel)
        bigView.addSubview(usernameTextField)
        bigView.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            parentView.topAnchor.constraint(equalTo: view.topAnchor),
            parentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            parentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            parentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
            bigView.heightAnchor.constraint(equalToConstant: 248),
            bigView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bigView.widthAnchor.constraint(equalTo: view.widthAnchor),
            bigView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: bigView.topAnchor, constant: -34),
            backButton.trailingAnchor.constraint(equalTo: bigView.trailingAnchor, constant: -20),
            
            headerLabel.topAnchor.constraint(equalTo: bigView.topAnchor, constant: 25),
            headerLabel.leadingAnchor.constraint(equalTo: bigView.leadingAnchor, constant: 20),
            
            usernameTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 15),
            usernameTextField.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            usernameTextField.heightAnchor.constraint(equalToConstant: 48),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            continueButton.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 32),
            continueButton.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
        ])
    }
    
    @objc func didTapBackButton(){
        self.remove()
    }
    
    @objc func didTapDismissButton() {
        self.remove()
    }
    
    @objc func didTapStartChatButton(){
        createRecipient { [weak self] name in
            self?.dismiss(animated: true) {
                self?.startChatCompletion?(name)
            }
        }
    }
    
    func createRecipient(completion: @escaping (String) -> Void){
        guard let username = usernameTextField.text?.trimmingCharacters(in: .whitespaces) else {
            return
        }
        if username == "" {
            let alert = UIAlertController(title: "Alert", message: "Please input a username first!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        } else {
            // Write Data to Firestore
            /// No information was given as to how to create the recipient,
            /// the collection reference and the recipient object
            let collection = Firestore.firestore().collection("recipients")
            let user = UserModel(
                userId: "JfpBYheu4zLhNMv539OR",
                name: username,
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
                }
                completion(username)
            }
            
        }
    }
}
