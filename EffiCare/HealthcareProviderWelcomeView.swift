//
//  HealthcareProviderWelcomeView.swift
//
//  Created by Connor Bly on 10/30/25.
//

import SwiftUI
import SwiftData
struct HealthcareProviderWelcomeView: View{
    @Environment(\.modelContext) var context
    @StateObject var providerViewModel: HealthcareProviderViewModel
    @ObservedObject var locationManager: LocationManager
    @State private var showProfile = false
    @Binding var showLogin: Bool
    
    init(context: ModelContext, currentUser: User, showLogin: Binding<Bool>, locationManger: LocationManager){
        _providerViewModel = StateObject(wrappedValue: HealthcareProviderViewModel(context: context, currentProvider: currentUser))
        self._showLogin = showLogin
        self.locationManager = locationManger
    }
    var body: some View{
        TabView{
            PatientsListView(providerViewModel: providerViewModel)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Patients")
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
            ProfileView(currentUser: UserViewModel(currentUser: providerViewModel.currentProvider), showLogin: $showLogin)
        }
    }
}
