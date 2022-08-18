//
//  LoginResponse.swift
//  LoginMVVM
//
//  Created by Narender Kumar on 16/08/22.
//

import Foundation

struct LoginResponse : Decodable {
    let errorMessage: String?
    let data: User?
}

struct User: Decodable {
    let userName: String?
    let userId: Int?
    let email: String?
}
