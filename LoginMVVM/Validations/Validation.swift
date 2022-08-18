//
//  Validation.swift
//  LoginMVVM
//
//  Created by Narender Kumar on 16/08/22.
//

import Foundation

struct LoginValidation {

    func Validate(loginRequest: LoginRequest) -> ValidationResult
    {
        if(loginRequest.userEmail.isEmpty)
        {
            return ValidationResult(success: false, error: "User email is empty")
        }
        
//        if !loginRequest.userEmail.isValidEmail() {
//            return ValidationResult(success: false, error: "User email is not valid")
//        }

        if(loginRequest.userPassword.isEmpty)
        {
            return ValidationResult(success: false, error: "User password is empty")
        }

        return ValidationResult(success: true, error: nil)
    }

}


extension String{
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
