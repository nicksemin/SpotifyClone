//
//  AuthManager.swift
//  SpotifyClone
//
//  Created by Nick Semin on 11.03.2023.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    enum Constants {
        static let clientID  = "5b65105b46264d88b6ce11a0e945038b"
        static let clientSecret = "81da385674a34ce895b92ac1b2612d6e"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
    }
    
    public var signInURL: URL? {
        let base = "https://accounts.spotify.com/authorize"
        let redirectURI = "https://www.google.com"
        let scope = "user-read-private"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scope)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        
        return URL(string: string )
    }
    
    private init() {
        
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping ((Bool) -> Void)) {
        guard let url = URL(string: Constants.tokenAPIURL) else { return }

        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type",
                         value: "authorization_code"),
            URLQueryItem(name: "code",
                         value: code),
            URLQueryItem(name: "redirect_uri",
                         value: "https://www.google.com")
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("", forHTTPHeaderField: "string")
        request.httpBody = components.query?.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(false)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data,
                                                            options: .allowFragments)
                print("SUCCESS: \(json)")
            } catch {
                print(error.localizedDescription)
                completion(false)
            }
            
        }
        task.resume()
    }
    
    private func cacheToken() {
        
    }
    
    private func refreshToken() {
        
    }
}

