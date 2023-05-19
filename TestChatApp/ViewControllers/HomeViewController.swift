//
//  HomeViewController.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit

class HomeViewController: BaseViewController {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateConstraint()
    }
    
    private func activateConstraint() {
        view.addSubview(headerLabel)
        view.addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            dividerView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 16),
            dividerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            dividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func didTapLoginButton(){
        let vc = BaseTabBarViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
