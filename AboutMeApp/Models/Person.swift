//
//  AboutMeApp
//
//  Created by Данис Гаязов on 29.6.24..
//

import Foundation

struct PersonalInformation {
    let name: String
    let surname: String
    let company: String
    let position: String
    let bio: String
    
    static func getPersonalInfo() -> PersonalInformation {
        PersonalInformation(
            name: "Danis",
            surname: "Gaiazov",
            company: "Yandex",
            position: "Project Manager",
            bio: """
Я Данис. Живу в Белграде, наслаждаюсь летом и интенсивно погружаюсь в IOS разработку.
10 лет проработал проджектом в Яндексе.
В свободное время занимаюсь музыкой, увлечен железными инструментами и dawless лайвами.
Любимые жанры: дроун, эмбиент, техно
"""
        )
    }
}

