//
//  ProviderConditionDetailsView.swift
//
//  Created by Connor Bly on 11/23/25.
//

import SwiftUI
import SwiftData
struct ProviderConditionDetailsView: View {
    @Environment(\.modelContext) private var context
    @ObservedObject var messageViewModel: MessageViewModel
    
    init(condition: Condition, currentUser: User, context: ModelContext){
        self.messageViewModel = MessageViewModel(context: context, condition: condition, currentUser: currentUser, otherUser: currentUser)
    }
    var body: some View {
        TabView{
            VStack(alignment: .leading){
                Text("Condition Name: \(messageViewModel.condition.name)")
                    .font(.largeTitle)
                Text("Condition Description: \(messageViewModel.condition.descriptionText)")
                    .font(.title)
                Text("Severity: \(Int(messageViewModel.condition.severity))")
            }
            .tabItem{
                Label("Details", systemImage: "info.circle")
            }
            MessagesView(messageViewModel: messageViewModel)
                .tabItem{
                    Label("Messages", systemImage: "message.fill")
                }
            
        }
    }
}
