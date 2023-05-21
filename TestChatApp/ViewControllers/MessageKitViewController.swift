//
//  MessageKitViewController.swift
//  TestChatApp
//
//  Created by Tes on 20/05/2023.
//

import UIKit
import MessageKit

class MessageKitViewController: MessagesViewController {
    let currentUser = Sender(senderId: "avatar", displayName: "Tes")
    let otherUser = Sender(senderId: "other", displayName: "Sally")
    var messages: [Message] = [] {
        didSet {
            messagesCollectionView.reloadData()
        }
    }
    
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
        button.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        button.backgroundColor = UIColor(hexString: "#007665")
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateConstraint()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.setTabBarHidden(true, animated: true)
        self.inputContainerView.removeFromSuperview()
        setupNavigationBarItems()
        messageInputBar.isHidden = true
        showMessageTimestampOnSwipeLeft = true
        populateMessageTray()
//        print("see all messages \(messages)")
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.setTabBarHidden(true, animated: true)
    }
    
    func populateMessageTray() {
        messages.append(Message(sender: currentUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-2000),
                                kind: .text("Hi"))
        )
        
        messages.append(Message(sender: currentUser,
                                messageId: "2",
                                sentDate: Date().addingTimeInterval(-2000),
                                kind: .text("find attached the image below as promised."))
        )
        
        messages.append(Message(sender: currentUser,
                                messageId: "3",
                                sentDate: Date().addingTimeInterval(-3000),
                                kind: .photo(Media(url: nil,
                                                   image: UIImage(named: "imageThumbnail"),
                                                   placeholderImage: UIImage(named: "imageThumbnail")!,
                                                   size: CGSize(width: 250, height: 200))
                                ))
        )
        messages.append(Message(sender: otherUser,
                                messageId: "3",
                                sentDate: Date(),
                                kind: .text("Hi to you too, thanks a bunch!"))
        )
    }
    
    func setupNavigationBarItems(){
        avatar.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        nameLabel.frame = CGRect(x: 0, y: 0, width: 170, height: 27)
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: self, action: #selector(didTapBackButton)),
            UIBarButtonItem(customView: avatar),
            UIBarButtonItem(customView: nameLabel)
            
        ]
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func activateConstraint() {
        view.addSubview(messageTextField)
        view.addSubview(sendButton)
                
        NSLayoutConstraint.activate([
            messageTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -1),
            messageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            messageTextField.heightAnchor.constraint(equalToConstant: 50),
            messageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -74),
            
            sendButton.heightAnchor.constraint(equalToConstant: 50),
            sendButton.centerYAnchor.constraint(equalTo: messageTextField.centerYAnchor),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sendButton.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func didTapSendButton(){
        guard let text = messageTextField.text else {
            return
        }
        let randomInt = Int.random(in: 1..<100)
        self.messages.append(Message(sender: currentUser,
                                                     messageId: "\(randomInt)A",
                                                     sentDate: Date(),
                                                     kind: .text(text))
                             )
        self.messageTextField.text = ""
        self.messageTextField.resignFirstResponder()
    }
    
    @objc func didTapBackButton(){
        self.navigationController?.popViewController(animated: true)
    }

}

extension MessageKitViewController: MessagesDataSource {

    var currentSender: SenderType {
        currentUser
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
//        let sigil = Sigil(ship: Sigil.Ship(rawValue: message.sender.senderId)!, color: .black).image(with: CGSize(width: 24.0, height: 24.0))
        let avatar = Avatar(image: UIImage(named: message.sender.senderId), initials: "")
            avatarView.set(avatar: avatar)
            avatarView.isHidden = isNextMessageSameSender(at: indexPath)
    }

    func isNextMessageSameSender(at indexPath: IndexPath) -> Bool {
        guard indexPath.section + 1 < messages.count else { return false }
        return messages[indexPath.section].sender.displayName == messages[indexPath.section + 1].sender.displayName
    }
}

extension MessageKitViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {}



struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

struct Media: MediaItem {
    var url: URL?
    var image: UIImage?
    var placeholderImage: UIImage
    var size: CGSize
}
