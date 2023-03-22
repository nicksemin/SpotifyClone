//
//  AuthResponse.swift
//  SpotifyClone
//
//  Created by Nick Semin on 19.03.2023.
//

import Foundation

struct AuthResponse: Codable {
    let accessToken: String
    let expirationTime: Int
    let refreshToken: String?
    let scope: String
    let tokenType: String
    
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expirationTime = "expires_in"
        case refreshToken = "refresh_token"
        case scope
        case tokenType = "token_type"
    }
}
