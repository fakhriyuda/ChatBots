import SwiftUI

// Make the ViewModel public
public class ChatBotsViewModel: ObservableObject {
    @Published public var messages: [String] = ["Hello! 👋", "How are you?"]

    // Public initializer
    public init() {}

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
