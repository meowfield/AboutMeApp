//
//  AboutMeApp
//
//  Created by Данис Гаязов on 29.6.24..
//

import Foundation

struct User {
    let user: String
    let password: String
    let id: PersonalInformation
    
    static func showUserInfo() -> User {
        return User(user: "User", password: "Password", id: PersonalInformation.getPersonalInfo())
    }
}
