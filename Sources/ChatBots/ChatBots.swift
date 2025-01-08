// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct ChatBots: View {
    @ObservedObject var viewModel: ChatBotsViewModel // Observing the ViewModel
    
    @State private var currentMessage: String = ""

    // Internal initializer
      internal init(viewModel: ChatBotsViewModel) {
          self.viewModel = viewModel
      }
    
    public var body: some View {
        VStack {
            // Chat Messages
            List {
                ForEach(viewModel.messages, id: \.self) { message in
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
                }
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

    // Send message function
    public func sendMessage() {
        viewModel.sendMessage(message: currentMessage)
        currentMessage = ""
    }

    // Print function to append messages
    public func cobaPrint(tulis: String) {
        viewModel.cobaPrint(tulis: tulis)
    }
}
