//
//  BaseTabBarViewController.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit

class BaseTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createHomeNavigationController(), createChatNavigationController(), createCameraNavigationController(), createSettingsNavigationController()]
        tabBar.unselectedItemTintColor = UIColor(hexString: "#B1B1B1")
        tabBar.tintColor = UIColor(hexString: "#55A99D")
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func createHomeNavigationController() -> UINavigationController {
        let vc = HomeViewController()
        vc.tabBarItem.image = UIImage(named: "home")
        return UINavigationController(rootViewController: vc)
    }
    
    private func createChatNavigationController() -> UINavigationController {
        let vc = ChatViewController()
        vc.tabBarItem.image = UIImage(named: "chat")
        return UINavigationController(rootViewController: vc)
    }
    
    private func createCameraNavigationController() -> UINavigationController {
        let vc = CameraViewController()
        vc.tabBarItem.image = UIImage(named: "camera")
        return UINavigationController(rootViewController: vc)
    }
    
    private func createSettingsNavigationController() -> UINavigationController {
        let vc = SettingsViewController()
        vc.tabBarItem.image = UIImage(named: "settings")
        return UINavigationController(rootViewController: vc)
    }
}
