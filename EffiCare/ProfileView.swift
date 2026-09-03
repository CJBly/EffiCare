//
//  ProfileView.swift
//
//  Created by Connor Bly on 11/23/25.
//
import SwiftUI
import SwiftData

struct ProfileView: View{
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @ObservedObject var currentUser: UserViewModel
    @State private var showDeleteAccountAlert: Bool = false
    @Binding var showLogin: Bool
    
    var body: some View{
        Form{
            Section(header: Text("Profile Information")){
                Text("Username: \(currentUser.username)")
                Text("Password: \(currentUser.password)")
            }
            Section{
                Button("Sign Out"){
                    showLogin = true
                    dismiss()
                }
                .foregroundColor(.blue)
                Button("Delete Account"){
                    showDeleteAccountAlert = true
                }
                .alert(isPresented: $showDeleteAccountAlert) {
                    Alert(title: Text("Delete Account"), message: Text("Are you sure you want to delete your account?"), primaryButton: .destructive(Text("Yes")){
                        deleteAccount()
                    }, secondaryButton: .cancel(Text("No")))
                }
            }
        }
        .navigationTitle("Profile")
    }
    func deleteAccount(){
        context.delete(currentUser.currentUser)
        try? context.save()
        showLogin = true
        dismiss()
    }
}
