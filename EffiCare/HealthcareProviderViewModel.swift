//
//  HealthcareProviderViewModel.swift
//  FinalProject
//
//  Created by Connor Bly on 11/22/25.
//

import SwiftUI
import SwiftData
import Combine
import Foundation

class HealthcareProviderViewModel: ObservableObject {
    @Published var patients: [User] = []
    let context: ModelContext
    let currentProvider: User
    init(context: ModelContext, currentProvider: User){
        self.context = context
        self.currentProvider = currentProvider
    }
    func fetchAllPatients(){
        do{
            var descriptor = FetchDescriptor<User>()
            //New implementation, sorts whether or not user is patient or not as only patients will be fetched
            descriptor.predicate = #Predicate{ user in
                user.isHealthcareProvider == false
            }
            patients = try context.fetch(descriptor)
        }
        catch{
            print("Error fetching patients: \(error)")
        }
    }
}
