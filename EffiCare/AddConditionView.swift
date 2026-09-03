//
//  AddConditionView.swift
//
//  Created by Connor Bly on 11/22/25.
//
import SwiftUI

struct AddConditionView: View{
    @ObservedObject var patientViewModel: PatientViewModel
    @State private var conditionName = ""
    @State private var descriptionText = ""
    @State private var severity = 1.0
    @Environment(\.dismiss) var dismiss
    var body: some View{
        NavigationView{
            Form{
                TextField("Condition Name: ", text: $conditionName)
                TextField("Description: ", text: $descriptionText)
                Slider(value: $severity, in: 1...10, step: 1){
                    Text("Severity")
                }
                Text("Severity of Conditon: \(Int(severity))")
            }
            .navigationTitle("Add Condition")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Save"){
                        patientViewModel.addCondition(name: conditionName, description: descriptionText, severity: severity)
                        dismiss()
                    }
                }
            }
        }
    }
}
