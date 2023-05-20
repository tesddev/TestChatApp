//
//  MessageKitViewController.swift
//  TestChatApp
//
//  Created by Tes on 20/05/2023.
//

import UIKit
import MessageKit

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

class MessageKitViewController: MessagesViewController {
    let currentUser = Sender(senderId: "self", displayName: "Tes")
    let otherUser = Sender(senderId: "other", displayName: "Sally")
    var messages: [Message] = [] {
        didSet {
            print("set")
            messagesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(Message(sender: currentUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-3000),
                                kind: .photo(Media(url: nil,
                                                   image: UIImage(named: "imageThumbnail"),
                                                   placeholderImage: UIImage(named: "imageThumbnail")!,
                                                   size: CGSize(width: 250, height: 200))
                                ))
        )
        
        messages.append(Message(sender: currentUser,
                                messageId: "2",
                                sentDate: Date().addingTimeInterval(-2000),
                                kind: .text("Hi"))
        )
        
        messages.append(Message(sender: otherUser,
                                messageId: "3",
                                sentDate: Date(),
                                kind: .text("Hi to you too"))
        )
        print("see all messages \(messages)")
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
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
}

extension MessageKitViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {}
