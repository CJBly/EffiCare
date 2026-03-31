//
//  ContentView.swift
//  FinalProject
//
//  Created by Connor Bly on 10/30/25.
//
//Attempted Firebase but counldn't get it to sync up properly. As such I am using only SwiftData
//I have included a preset patient and healthcare provider sign in. This is at .onAppear()
//For some reason the mapping is acting weird. You have to click the |> button in the xcode terminal as the LocationManager is denied. This is despite not being in the mapping tab where it requests for permission
import SwiftUI
import MapKit
import CoreLocation
import SwiftData
//Will put the struct and func in proper files. Making sure Map functionality works properly at the moment

struct ContentView: View {
    @Environment(\.modelContext) var context
    @StateObject private var locationManager = LocationManager()
    @State private var showLoginPatient = false;
    @State private var showLoginHealthcareProvider = false;
    @Binding var showLogin: Bool
    var body: some View {
        NavigationView{
            VStack{
                Button("Log in as Patient"){
                    showLoginPatient = true;
                }
                .buttonStyle(.borderedProminent)
                .padding()
                NavigationLink(
                    destination: LoginView(isUserHealthcareProvider: false, context: context, showLogin: $showLogin, locationManager: locationManager), isActive: $showLoginPatient
                ){
                    EmptyView()
                }
                .hidden()
                Button("Log in as Healthcare Provider"){
                    showLoginHealthcareProvider = true;
                }
                .buttonStyle(.borderedProminent)
                NavigationLink(
                    destination: LoginView(isUserHealthcareProvider: true, context: context, showLogin: $showLogin, locationManager: locationManager), isActive: $showLoginHealthcareProvider
                ){
                    EmptyView()
                }
                .hidden()
            }
            .onAppear{
                preloadTestUsers()
                locationManager.requestPermission()
            }
        }
    }
    private func preloadTestUsers(){
        let descriptor = FetchDescriptor<User>()
        if let existingUsers = try? context.fetch(descriptor), !existingUsers.isEmpty{
            return
        }
        let patient = User(username: "Patient1", password: "1369", isHealthcareProvider: false)
        let healthcareProvider = User(username: "Provider1", password: "abcd", isHealthcareProvider: true)
        context.insert(patient)
        context.insert(healthcareProvider)
        try? context.save()
    }
}

/*#Preview {
    ContentView()
}*/
