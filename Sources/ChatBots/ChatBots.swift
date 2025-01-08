// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct ChatBots: View {
    @State private var messages: [String] = ["Hello! 👋", "How are you?"]
    @State private var currentMessage: String = ""
    
    public init(messages: [String], currentMessage: String) {
        self.messages = messages
        self.currentMessage = currentMessage
    }
    
    public var body: some View {
        VStack {
            // Chat Messages
            List {
                ForEach(messages, id: \.self) { message in
                    HStack {
                        if message.starts(with: "You: ") {
                            Spacer() // Align user's messages to the right
                            Text(message)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(10)
                                .frame(maxWidth: 250, alignment: .trailing)
                        } else {
                            Text(message)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                                .frame(maxWidth: 250, alignment: .leading)
                            Spacer() // Align other messages to the left
                        }
                    }
                }.listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            
            // Message Input
            HStack {
                TextField("Type a message...", text: $currentMessage)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .frame(minHeight: 40)
                
                Button(action: {
                    self.sendMessage()
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .padding()
        }
    }
    public func sendMessage() {
        guard !currentMessage.isEmpty else { return }
        messages.append("You: \(currentMessage)")
        currentMessage = ""
    }
    
    public func cobaPrint(tulis : String){
        print(tulis)
        messages.append(tulis)
    }
}
