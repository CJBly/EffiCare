//
//  MessageModel.swift
//
//  Created by Connor Bly on 11/22/25.
//

import SwiftData
import Foundation

@Model
final class Message{
    var messageText: String
    var senderUsername: String
    var receiverUsername: String
    
    init(messageText: String, senderUsername: String, receiverUsername: String) {
        self.messageText = messageText
        self.senderUsername = senderUsername
        self.receiverUsername = receiverUsername
    }
}
