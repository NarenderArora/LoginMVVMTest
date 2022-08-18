//
//  LoginViewModel.swift
//  LoginMVVM
//
//  Created by Narender Kumar on 16/08/22.
//

import Foundation

protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponse?)
}

struct LoginViewModel
{
    var delegate : LoginViewModelDelegate?

    func loginUser(loginRequest: LoginRequest)
    {
        let validationResult = LoginValidation().Validate(loginRequest: loginRequest)
        
        if(validationResult.success)
        {
            sleep(2)
            let loginApiResponse = LoginResponse(errorMessage: nil, data: User(userName: "Narender", userId: 1, email: loginRequest.userEmail))
            
            DispatchQueue.main.async {
                self.delegate?.didReceiveLoginResponse(loginResponse: loginApiResponse)
            }
            
        }
        self.delegate?.didReceiveLoginResponse(loginResponse: LoginResponse(errorMessage: validationResult.error, data: nil))
    }
}
