//
//  HomeTableViewCell.swift
//  TestChatApp
//
//  Created by Tes on 20/05/2023.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    var noThumbnail = NSLayoutConstraint()
    var yesThumbnail = NSLayoutConstraint()
    
    static let identifier = "HomeTableViewCell"
    
    let avatar: AvatarImageView = {
        let image = AvatarImageView(frame: CGRect())
        image.image = UIImage(named: "feedAvatar")
        image.layer.cornerRadius = 10
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = AppLabel()
        label.font = UIFont().useInterFont(ofSize: 18, weight: .medium)
        label.text = "Cynthia Kulmax"
        return label
    }()
    
    var usernameLabel: UILabel = {
        let label = AppLabel()
        label.font = UIFont().useInterFont(ofSize: 11, weight: .medium)
        label.textColor = UIColor(hexString: "#707070")
        label.text = "@quenme"
        return label
    }()
    
    let elipse: AvatarImageView = {
        let image = AvatarImageView(frame: CGRect())
        image.image = UIImage(named: "ellipse")
        image.layer.cornerRadius = 2
        return image
    }()
    
    var locationLabel: UILabel = {
        let label = AppLabel()
        label.font = UIFont().useInterFont(ofSize: 11, weight: .medium)
        label.text = "Lagos, Nigeria"
        label.textColor = UIColor(hexString: "#707070")
        return label
    }()
    
    let elipse1: AvatarImageView = {
        let image = AvatarImageView(frame: CGRect())
        image.image = UIImage(named: "ellipse")
        image.layer.cornerRadius = 2
        return image
    }()
    
    var timeStampLabel: UILabel = {
        let label = AppLabel()
        label.font = UIFont().useInterFont(ofSize: 11, weight: .medium)
        label.text = "2m ago"
        label.textColor = UIColor(hexString: "#707070")
        return label
    }()
    
    let optionImage: AvatarImageView = {
        let image = AvatarImageView(frame: CGRect())
        image.image = UIImage(named: "elipseGroup")
        image.layer.cornerRadius = 0
        return image
    }()
    
    var descriptionLabel: AppLabel = {
        let label = AppLabel()
        label.font = UIFont().useInterFont(ofSize: 14, weight: .regular)
        label.text = "Hi, David. Hope you’re doing...."
        label.numberOfLines = 10
        return label
    }()
    
    let thumbnailImageView: AvatarImageView = {
        let image = AvatarImageView(frame: CGRect())
        image.image = UIImage(named: "imageThumbnail")
        return image
    }()
    
    let engagementImageView: AvatarImageView = {
        let image = AvatarImageView(frame: CGRect())
        image.image = UIImage(named: "interaction")
        return image
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatar)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(elipse)
        contentView.addSubview(locationLabel)
        contentView.addSubview(elipse1)
        contentView.addSubview(timeStampLabel)
        contentView.addSubview(optionImage)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(engagementImageView)
        setUpViews()
    }
    
    func configureWith(model: PostResponseModel1){
        self.selectionStyle = .none
        if model.noMedia {
            yesThumbnail.isActive = false
            noThumbnail.isActive = true
            thumbnailImageView.isHidden = true
        } else {
            noThumbnail.isActive = false
            yesThumbnail.isActive = true
            thumbnailImageView.isHidden = false
            let hasVideo = model.video ?? false
            let imageURL = URL(string: model.thumbnail ?? "https://firebasestorage.googleapis.com/v0/b/blinqpost.appspot.com/o/blinqpayapp_283378730_5263452000387376_8497039804548532757_n.jpg?alt=media&token=445db31e-533b-4feb-b2dc-a7b7950a8ae9")!
            if hasVideo {
                print("show video")
                let transformer = SDImageResizingTransformer(size: CGSize(width: contentView.viewWidth, height: 238), scaleMode: .aspectFill)
                thumbnailImageView.sd_setImage(with: imageURL,  placeholderImage: UIImage(named: "videoThumbnail"), context: [.imageTransformer: transformer])
            } else {
                print("show image")
                let transformer = SDImageResizingTransformer(size: CGSize(width: contentView.viewWidth, height: 238), scaleMode: .aspectFill)
                thumbnailImageView.sd_setImage(with: imageURL,  placeholderImage: UIImage(named: "imageThumbnail"), context: [.imageTransformer: transformer])
            }
        }
        self.usernameLabel.text = model.username
        self.descriptionLabel.text = model.description
        self.timeStampLabel.text = convertTimeInterval(timeStamp: model.timestamp)
        self.nameLabel.text = model.username
    }
    
    func setUpViews() {
        NSLayoutConstraint.activate([
            avatar.heightAnchor.constraint(equalToConstant: 42),
            avatar.widthAnchor.constraint(equalToConstant: 42),
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 12),
            
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            elipse.heightAnchor.constraint(equalToConstant: 4),
            elipse.widthAnchor.constraint(equalToConstant: 4),
            elipse.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 6),
            elipse.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: usernameLabel.topAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 16),
            
            elipse1.heightAnchor.constraint(equalToConstant: 4),
            elipse1.widthAnchor.constraint(equalToConstant: 4),
            elipse1.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 6),
            elipse1.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor),
            
            timeStampLabel.topAnchor.constraint(equalTo: usernameLabel.topAnchor),
            timeStampLabel.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 16),
            
            optionImage.heightAnchor.constraint(equalToConstant: 18),
            optionImage.widthAnchor.constraint(equalToConstant: 4.13),
            optionImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            optionImage.centerYAnchor.constraint(equalTo: avatar.centerYAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 238),
            thumbnailImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            thumbnailImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            thumbnailImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            engagementImageView.heightAnchor.constraint(equalToConstant: 24),
            engagementImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            engagementImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            engagementImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
        
        noThumbnail = engagementImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12)
        yesThumbnail = engagementImageView.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 12)

        yesThumbnail.isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func convertTimeInterval(timeStamp: Int) -> String {
        let myTimeInterval = TimeInterval(timeStamp)
        let date = Date().addingTimeInterval(-myTimeInterval)
        print("ago \(date.timeAgoDisplay())")
        return date.timeAgo()
    }
    
}

struct HomeTableViewCellModel {
    let description, link, id, thumbnail, userID, username: String
    let noMedia, video: Bool
}
