//
//  ChatsTableViewCell.swift
//  TestChatApp
//
//  Created by Tes on 19/05/2023.
//

import UIKit

class ChatsTableViewCell: UITableViewCell {
    
    static let identifier = "AccountSettingsTableViewCell"
    
    var nameLabel: UILabel = {
        let label = AppLabel()
        label.font = UIFont().useInterFont(ofSize: 18, weight: .medium)
        label.text = "Smith Mathew"
        return label
    }()
    
    var messageLabel: AppLabel = {
        let label = AppLabel()
        label.font = UIFont().useInterFont(ofSize: 16, weight: .regular)
        label.text = "Hi, David. Hope you’re doing...."
        label.textColor = UIColor(hexString: "#9C9797")
        return label
    }()
    
    var dateLabel: AppLabel = {
        let label = AppLabel()
        label.font = UIFont().useInterFont(ofSize: 14, weight: .regular)
        label.text = "29 mar"
        label.textColor = UIColor(hexString: "#C5BDBD")
        return label
    }()
    
    let avatar: AvatarImageView = {
        let image = AvatarImageView(frame: CGRect())
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(messageLabel)
        contentView.addSubview(avatar)
        contentView.addSubview(dateLabel)
        setUpViews()
    }
    
    func configureWith(model: ChatsTableViewCellModel){
        self.selectionStyle = .none
        self.nameLabel.text = model.name
        self.dateLabel.text = model.date
        self.messageLabel.text = model.message
        self.avatar.image = UIImage(named: model.imageString)
    }
    
    func setUpViews() {
        NSLayoutConstraint.activate([
            avatar.heightAnchor.constraint(equalToConstant: 50),
            avatar.widthAnchor.constraint(equalToConstant: 50),
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: avatar.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 23),
            
            messageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: avatar.bottomAnchor),
            
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dateLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

struct ChatsTableViewCellModel {
    let name, message, date, imageString: String
}
