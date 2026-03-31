//
//  PatientsWelcomeView.swift
//  FinalProject
//
//  Created by Connor Bly on 10/30/25.
//

import SwiftUI
import SwiftData
struct PatientsWelcomeView: View{
    @Environment(\.modelContext) var context
    @ObservedObject var patientsViewModel: PatientViewModel
    @ObservedObject var locationManager: LocationManager
    @State private var showProfile = false
    @Binding var showLogin: Bool
    
    init(currentUser: User, context: ModelContext, showLogin: Binding<Bool>, locationManager: LocationManager){
        self.patientsViewModel = PatientViewModel(context: context, currentUser: currentUser)
        self._showLogin = showLogin
        self.locationManager = locationManager
    }
    var body: some View{
        TabView{
            ConditionsView(patientViewModel: patientsViewModel)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Conditions")
                }
            MapPageView(locationManager: locationManager)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button(action: {showProfile = true}){
                    Image(systemName: "person.circle")
                        .imageScale(.large)
                }
            }
        }
        .sheet(isPresented: $showProfile){
            ProfileView(currentUser: UserViewModel(currentUser: patientsViewModel.currentUser), showLogin: $showLogin)
        }
    }
}
