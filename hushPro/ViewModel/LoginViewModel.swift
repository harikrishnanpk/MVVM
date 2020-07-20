//
//  LoginViewModel.swift
//  hushPro
//
//  Created by harikrishnan on 25/06/20.
//  Copyright © 2020 ErbauenLabs. All rights reserved.
//

import Foundation

enum LoginValidationState {
    case Valid
    case InValid(String)
}

class LoginViewModel {    
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var email:String {
        return user.email
    }
        
    var password:String {
        return user.password
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isValidatePassword(_ password: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        
        let passPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        
        return passPred.evaluate(with: password)
    }
}

extension LoginViewModel{
    func updateEmail(email: String) {
        user.email = email
    }
    
    func updatePassword(password: String) {
        user.password = password
    }
    
    func saveUserIsLoggedIn() {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
    
    func validate() -> LoginValidationState {
        
        if user.email.isEmpty || user.password.isEmpty {
            return .InValid("Email and Password required.")
        }else if !isValidEmail(user.email){
            return .InValid("Please Enter Valid Email")
        }else if !isValidatePassword(user.password){
            return .InValid("Password should have Minimum 8 characters at least 1 Alphabet and 1 Number")
        }
        
        return .Valid
    }
}
