//
//  PatientViewModel.swift
//  FinalProject
//
//  Created by Connor Bly on 11/22/25.
//
import SwiftData
import SwiftUI
import Combine

class PatientViewModel: ObservableObject{
    @Published var conditions: [Condition] = []
    let currentUser: User
    let context: ModelContext
    init(context: ModelContext, currentUser: User){
        self.context = context
        self.currentUser = currentUser
        self.conditions = currentUser.patientConditions
    }
    func addCondition(name: String, description: String, severity: Double){
        let userCondition = Condition(name: name, descriptionText: description, severity: severity)
        currentUser.patientConditions.append(userCondition)
        context.insert(userCondition)
        try? context.save()
        conditions = currentUser.patientConditions
    }
    func deleteCondition(at offsets: IndexSet){
        offsets.forEach{ index in
            let userCondition = conditions[index]
            context.delete(userCondition)
        }
        try? context.save()
        conditions = currentUser.patientConditions
        
    }
}
