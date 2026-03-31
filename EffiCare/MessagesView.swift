//
//  MessagesView.swift
//  FinalProject
//
//  Created by Connor Bly on 11/23/25.
//

import SwiftUI
struct MessagesView: View{
    @ObservedObject var messageViewModel: MessageViewModel
    @State private var messageText = ""
    var body: some View{
        VStack{
            List(messageViewModel.userMessages){ message in
                HStack{
                    if message.senderUsername == messageViewModel.currentUser.username{
                        Spacer()
                        Text(message.messageText)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    else{
                        Text(message.messageText)
                            .padding()
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                }
            }
            HStack{
                TextField("New Message: ", text: $messageText)
                    .textFieldStyle(.roundedBorder)
                Button("Send"){
                    messageViewModel.sendMessage(messageText: messageText)
                    messageText = ""
                }
            }
        }
    }
}
