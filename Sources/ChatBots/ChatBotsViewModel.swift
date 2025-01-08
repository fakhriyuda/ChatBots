import SwiftUI

// Make the ViewModel public
public class ChatBotsViewModel: ObservableObject {
    @Published public var messages: [String]
    
    // Initialize with a default or custom set of messages
    public init(messages: [String] = ["Hello! 👋", "How are you?"]) {
        self.messages = messages
    }
    
    // Send message method
    public func sendMessage(message: String) {
        guard !message.isEmpty else { return }
        messages.append("You: \(message)")
    }
    
    // Print message and append it
    public func cobaPrint(tulis: String) {
        print(tulis)
        messages.append(tulis)
    }
}
