//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Данис Гаязов on 27.6.24..
//

import UIKit

final class WelcomeViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var welcomeMessageLabel: UILabel!
    
    // MARK: - Properties
    var user: String?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessageLabel.text = "Welcome, \(user ?? "")!"        
    }
    
    // MARK: - IBActions
    @IBAction func didTapLogOut() {
        self.dismiss(animated: true)
    }
}
