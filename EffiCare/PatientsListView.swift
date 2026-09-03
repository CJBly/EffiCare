//
//  PatientsListView.swift
//
//  Created by Connor Bly on 11/23/25.
//

import SwiftUI
import SwiftData

struct PatientsListView: View{
    @Environment(\.modelContext) private var context
    @ObservedObject var providerViewModel: HealthcareProviderViewModel
    
    var body: some View{
        NavigationStack{
            VStack{
                if providerViewModel.patients.isEmpty{
                    Text("No patients found")
                }
                else{
                    List(providerViewModel.patients){ patient in
                        NavigationLink(destination: PatientConditionsView(patient: patient, providerViewModel: providerViewModel)){
                            VStack(alignment: .leading){
                                Text(patient.username)
                                    .font(.headline)
                                Text("Patient")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Patients")
            .onAppear{
                providerViewModel.fetchAllPatients()
            }
        }
    }
}
