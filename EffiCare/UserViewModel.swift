//
//  UserViewModel.swift
//
//  Created by Connor Bly on 11/23/25.
//
import SwiftUI
import SwiftData
import Combine

class UserViewModel: ObservableObject{
    @Published var username: String
    @Published var password: String
    let currentUser: User
    
    init(currentUser: User){
        self.currentUser = currentUser
        self.username = currentUser.username
        self.password = currentUser.password
    }
    
}
