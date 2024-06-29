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
    var user: String!
    let topColor = UIColor(
        red: 0.6,
        green: 0.4,
        blue: 0.8,
        alpha: 1.0
    )
    let bottomColor = UIColor(
        red: 0.4,
        green: 0.8,
        blue: 0.4,
        alpha: 1.0
    )
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor: topColor, bottomColor: bottomColor)
        welcomeMessageLabel.text = "Welcome, \(user ?? "")!"
    }
    
    // MARK: - IBActions
    @IBAction func didTapLogOut() {
        self.dismiss(animated: true)
    }
}

extension UIViewController {
    
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
