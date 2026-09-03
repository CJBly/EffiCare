//
//  UserModel.swift
//
//  Created by Connor Bly on 11/22/25.
//

import SwiftData

@Model
final class User{
    //New implementation: usernames must be unique so that there is no replication
    @Attribute(.unique) var username: String
    var password: String
    var isHealthcareProvider: Bool
    //New implementation @Relationship, established parent child relationship also allows deletion of child if parent is deleted
    @Relationship(deleteRule: .cascade) var patientConditions: [Condition] = []
    
    init(username: String, password: String, isHealthcareProvider: Bool){
        self.username = username
        self.password = password
        self.isHealthcareProvider = isHealthcareProvider
    }
}
