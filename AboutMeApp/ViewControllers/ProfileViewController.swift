//
//  ProfileViewController.swift
//  AboutMeApp
//
//  Created by Данис Гаязов on 29.6.24..
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var name: UILabel!
    @IBOutlet var surname: UILabel!
    @IBOutlet var company: UILabel!
    @IBOutlet var position: UILabel!
    @IBOutlet var person: UILabel!
    
    // MARK: - Properties
    var userData: User!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        person.text = "\(userData.id.name) \(userData.id.surname)"
        name.text = ("Имя: \(userData.id.name)")
        surname.text = ("Фамилия: \(userData.id.surname)")
        company.text = ("Компания: \(userData.id.company)")
        position.text = ("Должность: \(userData.id.position)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else {
            return
        }
        bioVC.userData = userData
    }
}


