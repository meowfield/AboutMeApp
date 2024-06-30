//
//  BioViewController.swift
//  AboutMeApp
//
//  Created by Данис Гаязов on 29.6.24..
//

import UIKit

final class BioViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var name: UILabel!    
    @IBOutlet var bio: UILabel!

    // MARK: - Properties
    var userData: User!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = ("\(userData.id.name) \(userData.id.surname) bio")
        bio.text = (userData.id.bio)
    }
}
