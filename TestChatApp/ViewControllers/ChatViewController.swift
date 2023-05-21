//
//  ChatViewController.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit

class ChatViewController: BaseViewController {
    
    var model: [ChatsTableViewCellModel] = [
        ChatsTableViewCellModel.init(name: "Smith Mathew", message: "Hi, David. Hope you’re doing....", date: "29 mar", imageString: "avatar"),
        ChatsTableViewCellModel.init(name: "Mary Ann", message: "Are you ready for today’s part..", date: "29 mar", imageString: "other"),
    ]
    
    var headerLabel: AppLabel = {
        let label = AppLabel()
        label.text = "Chat"
        return label
    }()
    
    public var chatsTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.register(ChatsTableViewCell.self, forCellReuseIdentifier: ChatsTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()
    
    lazy var plusButton: AppButton = {
        let button = AppButton()
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        button.layer.cornerRadius = 25
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateConstraint()
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.setTabBarHidden(false, animated: false)
    }
    
    private func activateConstraint() {
        view.addSubview(headerLabel)
        view.addSubview(chatsTableView)
        view.addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            chatsTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 48),
            chatsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            chatsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            chatsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            plusButton.heightAnchor.constraint(equalToConstant: 50),
            plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            plusButton.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func didTapLoginButton(){
        let vc = NewChatViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.startChatCompletion = { [weak self] name in
            let vc = MessageKitViewController()
            vc.hidesBottomBarWhenPushed = true
            vc.nameLabel.text = name.uppercased()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        present(vc, animated: true)
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatsTableViewCell.identifier) as? ChatsTableViewCell else {
            return UITableViewCell()
        }
        cell.configureWith(model: model[indexPath.row])
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MessageKitViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}
