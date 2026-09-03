//
//  MessageViewModel.swift
//
//  Created by Connor Bly on 11/22/25.
//
import SwiftUI
import SwiftData
import Combine

class MessageViewModel: ObservableObject {
    @Published var userMessages: [Message] = []
    let context: ModelContext
    let condition: Condition
    let currentUser: User
    let otherUser: User
    
    init(context: ModelContext, condition: Condition, currentUser: User, otherUser: User) {
        self.userMessages = condition.conditionMessages
        self.context = context
        self.condition = condition
        self.currentUser = currentUser
        self.otherUser = otherUser
    }
    
    func sendMessage(messageText: String){
        let userMessage = Message(messageText: messageText, senderUsername: currentUser.username, receiverUsername: otherUser.username)
        condition.conditionMessages.append(userMessage)
        context.insert(userMessage)
        try? context.save()
        userMessages = condition.conditionMessages
    }
}
