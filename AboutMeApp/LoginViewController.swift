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
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.user = userTextField.text
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userTextField.text == user, passwordTextField.text == password else {
            showAlert()
            return false
        }
        return true
    }
    
    // MARK: - IBActions
    @IBAction func showUserName() {
        let alert = UIAlertController(title: "Forgot user name?", message: "Your name is: \(user)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: { _ in
            self.userTextField.text = "" }))
        present(alert, animated: true)
    }
    
    @IBAction func showPassword() {
        let alert = UIAlertController(title: "Forgot password?", message: "Your password is: \(password)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: { _ in
            self.passwordTextField.text = "" }))
        present(alert, animated: true)
    }
    
    @IBAction func didTaplogInButton() {
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        self.passwordTextField.text = ""
        self.userTextField.text = ""
    }
        
    // MARK: - Private Methods
    private func showAlert() {
        let alert = UIAlertController(title: "Check your data", message: "Wrong user or password!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            self.passwordTextField.text = ""
            self.userTextField.text = ""
        }))
        present(alert, animated: true)
    }
}

