//
//  LoginRequest.swift
//  LoginMVVM
//
//  Created by Narender Kumar on 16/08/22.
//

import Foundation

struct LoginRequest : Encodable {
    let userEmail, userPassword: String
}
