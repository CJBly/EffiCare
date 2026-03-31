//
//  LoginView.swift
//  FinalProject
//
//  Created by Connor Bly on 11/22/25.
//

import SwiftUI
import SwiftData

struct LoginView: View{
    @Environment(\.modelContext) var context
    @StateObject private var authenticationViewModel: AuthenticationViewModel
    @ObservedObject var locationManager: LocationManager
    @State private var username = ""
    @State private var password = ""
    @State private var userExists = false
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
                if authenticationViewModel.loginUser(username: username, password: password){
                    userExists = true
                }
            }
            NavigationLink(destination: goToWelcomeView(), isActive: $userExists){
                EmptyView()
            }.hidden()
            NavigationLink("Don't have an account yet?", destination: SignUpView(isUserHealthcareProvider: isUserHealthcareProvider, context: context, showLogin: $showLogin, locationManager: locationManager))
        }
    }
    //New implementation allows branching of resultant views
    @ViewBuilder
    func goToWelcomeView() -> some View{
        if let currentUser = authenticationViewModel.currentUser{
            if isUserHealthcareProvider{
                HealthcareProviderWelcomeView(context: context, currentUser: currentUser, showLogin: $showLogin, locationManger: locationManager)
            }else{
                PatientsWelcomeView(currentUser: currentUser, context: context, showLogin: $showLogin, locationManager: locationManager)
            }
        }
        else{
            EmptyView()
        }
        
    }
}
