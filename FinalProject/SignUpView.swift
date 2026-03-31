//
//  SignUpView.swift
//  FinalProject
//
//  Created by Connor Bly on 11/22/25.
//

import SwiftUI
import SwiftData

struct SignUpView: View{
    @Environment(\.modelContext) var context
    @StateObject private var authenticationViewModel: AuthenticationViewModel
    @ObservedObject var locationManager: LocationManager
    @State private var username = ""
    @State private var password = ""
    @State private var goToLogin = false
    let isUserHealthcareProvider: Bool
    @Binding var showLogin: Bool
    
    init(isUserHealthcareProvider: Bool, context: ModelContext, showLogin: Binding<Bool>, locationManager: LocationManager){
        self.isUserHealthcareProvider = isUserHealthcareProvider
        _authenticationViewModel = StateObject(wrappedValue: AuthenticationViewModel(context: context))
        self._showLogin = showLogin
        self.locationManager = locationManager
    }
    var body: some View{
        VStack(spacing: 15){
            TextField("Username: ", text: $username)
                .textFieldStyle(.roundedBorder)
            //New implementation used typically for password implementation
            SecureField("Password: ", text: $password)
                .textFieldStyle(.roundedBorder)
            Button("Log In"){
                if authenticationViewModel.signupUser(username: username, password: password, isHealthcareProvider: isUserHealthcareProvider){
                    goToLogin = true
                }
            }
            NavigationLink(destination: LoginView(isUserHealthcareProvider: isUserHealthcareProvider, context: context, showLogin: $showLogin, locationManager: locationManager), isActive: $goToLogin){
                EmptyView()
            }.hidden()
        }
    }
}
