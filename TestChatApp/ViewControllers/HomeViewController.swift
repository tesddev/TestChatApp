//
//  HomeViewController.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var model: [HomeTableViewCellModel] = [
        HomeTableViewCellModel.init(description: "I was at Kaduna state yesterday after a stressful week just to relax and nature was very awesome. Getting to see these things...more", link: "", id: "", thumbnail: "", userID: "", username: "@quenme", noMedia: true, video: false),
        HomeTableViewCellModel.init(description: "I was at Kaduna state yesterday after a stressful week just to relax and nature was very awesome. Getting to see these things...more", link: "", id: "", thumbnail: "", userID: "", username: "@quenme12", noMedia: false, video: false),
        HomeTableViewCellModel.init(description: "Have seemless transaction using qwid (www.qwid.io).", link: "", id: "", thumbnail: "", userID: "", username: "@quenme34", noMedia: false, video: true),
    ]
    
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
