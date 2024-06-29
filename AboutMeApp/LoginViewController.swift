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
    private let user = "User"
    private let password = "Password"
    
    // MARK: - Lifecycle Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.user = userTextField.text
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userTextField.text == user, passwordTextField.text == password else {
            showAlert(
                title: "Check your data",
                message: "Wrong username or password!"
            ) { self.passwordTextField.text = ""}
            return false
        }
        return true
    }

    // MARK: - IBActions
    @IBAction func showData(_ sender: UIButton) {
        sender.tag == 0 ? showAlert(
            title: "Forgot User Name?",
            message: "Username is \(user)"
        ) : showAlert(
            title: "Forgot Password?",
            message: "Your password is \(password)"
        ) { self.passwordTextField.text = ""}
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = ""
        userTextField.text = ""
    }
        
    // MARK: - Private Methods
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
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

