//
//  AuthModel.swift
//  Travel Booking
//
//  Created by Krishna Suryavanshi on 10/26/24.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    
    struct User {
        let name: String
        let profileImage: String
    }
    
    func login(email: String, password: String) {
        // Simulate login process
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.currentUser = User(name: "Dinakar", profileImage: "profile_image")
            self.isAuthenticated = true
        }
    }
    
    func logout() {
        isAuthenticated = false
        currentUser = nil
    }
}
