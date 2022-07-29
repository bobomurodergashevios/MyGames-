//
//  File.swift
//  MyGames
//
//  Created by admin on 7/18/22.
//

import Foundation
class File {
    static var GAME_KEY_PASSWORD = "shared_password_key"
    static var GAME_KEY_LOGIN    = "shared_login_key"
    static var preference = UserDefaults.standard

    static func AddRegister(register:register){
      preference.set(register.login, forKey: GAME_KEY_LOGIN)
      preference.set(register.password, forKey: GAME_KEY_PASSWORD)
      preference.synchronize()
    }
    static func getRegister()->register?{
        if let login = preference.string(forKey: GAME_KEY_LOGIN),
           let password = preference.string(forKey: GAME_KEY_PASSWORD){
            return register(password: password, login: login)
        }
        return nil
    }
}
