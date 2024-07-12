//
//  LoginViewModel.swift
//  SurveyApp
//
//  Created by Syafiq Sobri on 12/07/2024.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    @Published var merchandiser: Merchandiser?
    
    private let mockMerchandisers = [
        Merchandiser(id: 1, username: "User1", password: "password1", name: "John Doe", age: 30, outletAssigned: "Outlet A"),
        Merchandiser(id: 2, username: "User2", password: "password2", name: "Jane Smith", age: 28, outletAssigned: "Outlet B")
    ]
    
    func login() {
        if let merchandiser = mockMerchandisers.first(where: { $0.username == username && $0.password == password }) {
            self.merchandiser = merchandiser
            isLoggedIn = true
        }
    }
}
