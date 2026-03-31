//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Connor Bly on 10/30/25.
//

import SwiftUI
import SwiftData
@main
struct EffiCareApp: App {
    @Environment(\.modelContext) private var context
    @State private var showLogin = true
    var body: some Scene {
        WindowGroup {
            ContentView(showLogin: $showLogin)
                .modelContainer(for: [User.self, Condition.self, Message.self])
        }
    }
}
