//
//  ViewController.swift
//  AboutMeApp
//
//  Created by Данис Гаязов on 27.6.24..
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Properties
    private let userData = User.showUserInfo()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.text = userData.user
        passwordTextField.text = userData.password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? TabBarController else {
            return
        }
        tabBarController.userData = userData
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userTextField.text == userData.user,
              passwordTextField.text == userData.password else {
            showAlert(
                title: "Check your data",
                message: "Wrong username or password!"
            ) { self.passwordTextField.text = "" }
            return false
        }
        return true
    }

    // MARK: - IBActions
    @IBAction func showData(_ sender: UIButton) {
        sender.tag == 0 ? showAlert(
            title: "Forgot User Name?",
            message: "Username is \(userData.user)"
        ) : showAlert(
            title: "Forgot Password?",
            message: "Your password is \(userData.password)"
        ) { self.passwordTextField.text = ""}
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = userData.password
        userTextField.text = userData.user
    }
        
    // MARK: - Private Methods
    private func showAlert(
        title: String,
        message: String,
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            completion?()
        }))
        present(alert, animated: true)
    }
}

