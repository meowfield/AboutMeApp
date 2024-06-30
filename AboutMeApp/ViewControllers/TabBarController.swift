//
//  TabBarController.swift
//  AboutMeApp
//
//  Created by Данис Гаязов on 30.6.24..
//

import UIKit

final class TabBarController: UITabBarController {
    var userData: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        guard let viewControllers else {
            return
        }
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.userData = userData
            } else if let proVC = $0 as? UINavigationController {
                let profileVC = proVC.topViewController
                guard let profileVC = profileVC as? ProfileViewController else {
                    return
                }
                profileVC.userData = userData
            }
        }
    }
}
