//
//  ConditionsView.swift
//
//  Created by Connor Bly on 11/22/25.
//
import SwiftUI
import SwiftData
struct ConditionsView: View{
    @ObservedObject var patientViewModel: PatientViewModel
    @State private var showAddCondition = false
    @Environment(\.modelContext) private var context
    
    var body: some View{
        NavigationView{
            List{
                ForEach(patientViewModel.conditions, id: \.self){ condition in
                    NavigationLink(destination: ConditionDetailsView(condition: condition, currentUser: patientViewModel.currentUser, context: context)){
                        VStack(alignment: .leading){
                            Text(condition.name)
                                .font(.headline)
                            Text("Severity: \(Int(condition.severity))")
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete(perform: patientViewModel.deleteCondition)
            }
            .navigationTitle("Conditions")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {showAddCondition = true}){
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddCondition){
                AddConditionView(patientViewModel: patientViewModel)
            }
        }
    }
}
