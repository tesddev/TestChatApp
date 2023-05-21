//
//  HomeViewController.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit
import FirebaseFirestore

class HomeViewController: BaseViewController {
    
    var model = [PostResponseModel1]() {
        didSet {
            self.contentTableView.reloadData()
        }
    }
    
    var headerLabel: AppLabel = {
        let label = AppLabel()
        label.text = "Feed"
        label.textColor = UIColor(hexString: "#55A99D")
        return label
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#F2F6F8")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var contentTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateConstraint()
        contentTableView.delegate = self
        contentTableView.dataSource = self
        fetchPostsWithBool { model in
            self.model = model
        }
    }
    
    private func activateConstraint() {
        view.addSubview(headerLabel)
        view.addSubview(dividerView)
        view.addSubview(contentTableView)

        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            dividerView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
            dividerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            dividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            contentTableView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 24),
            contentTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    @objc func didTapLoginButton(){
        let vc = BaseTabBarViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchPosts(handler: @escaping ([PostResponseModel]) -> Void){
        Firestore.firestore().collection("post").getDocuments { (snapshot, error) in
            var theMessages: [PostResponseModel] = []
            snapshot?.documents.forEach({ (document) in
                let dictionary = document.data()
                    let decoder = JSONDecoder()
                do {
                    let data = try JSONSerialization.data(withJSONObject: document.data(), options: .prettyPrinted)
                    let message = try decoder.decode(PostResponseModel.self, from: data)
                    theMessages.append(message)
                } catch {
                    print(error.localizedDescription)
                }
            })
            handler(theMessages)
        }
    }
    
    func fetchPostsWithBool(handler: @escaping ([PostResponseModel1]) -> Void){
        Firestore.firestore().collection("post").getDocuments { (snapshot, error) in
            var theMessages: [PostResponseModel1] = []
            snapshot?.documents.forEach({ (document) in
                let dictionary = document.data()
                    let decoder = JSONDecoder()
                do {
                    let data = try JSONSerialization.data(withJSONObject: document.data(), options: .prettyPrinted)
                    let message = try decoder.decode(PostResponseModel1.self, from: data)
                    theMessages.append(message)
                } catch {
                    print(error.localizedDescription)
                }
            })
            handler(theMessages)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.configureWith(model: model[indexPath.row])
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
