//
//  AuthenticationViewModel.swift
//  FinalProject
//
//  Created by Connor Bly on 11/22/25.
//

import SwiftUI
import SwiftData
import Combine

class AuthenticationViewModel: ObservableObject {
    @Published var currentUser: User?
    let context: ModelContext
    init(context: ModelContext){
        self.context = context
    }
    func loginUser(username: String, password: String) -> Bool{
        do{
            let descriptor = FetchDescriptor<User>()
            let users = try context.fetch(descriptor)
            if let user = users.first(where: { $0.username == username && $0.password == password}){
                currentUser = user
                return true
            }
        }
        catch{
            print("Login failed")
        }
        return false
    }
    func signupUser(username: String, password: String, isHealthcareProvider: Bool) -> Bool{
        do{
            let descriptor = FetchDescriptor<User>()
            let users = try context.fetch(descriptor)
            if let user = users.first(where: { $0.username == username}){
                return false
            }
            let newUser = User(username: username, password: password, isHealthcareProvider: isHealthcareProvider)
            context.insert(newUser)
            try context.save()
            currentUser = newUser
            return true
        }
        catch{
            print("Login failed")
            return false
        }
    }
}
