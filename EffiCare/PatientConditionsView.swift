//
//  PatientConditionsView.swift
//
//  Created by Connor Bly on 11/23/25.
//
import SwiftUI
import SwiftData
struct PatientConditionsView: View{
    @Environment(\.modelContext) private var context
    let patient: User
    @ObservedObject var providerViewModel: HealthcareProviderViewModel
    var body: some View{
        NavigationView{
            List{
                ForEach(patient.patientConditions){ condition in
                    NavigationLink(destination: ProviderConditionDetailsView(condition: condition, currentUser: providerViewModel.currentProvider, context: context)){
                        VStack(alignment: .leading){
                            Text(condition.name)
                                .font(.headline)
                            Text("Severity: \(Int(condition.severity))")
                        }
                    }
                }
            }
            .navigationTitle("\(patient.username)'s Conditions")
        }
    }
}
