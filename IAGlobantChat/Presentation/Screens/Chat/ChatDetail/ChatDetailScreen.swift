import SwiftUI

struct ChatDetailScreen: View {
    let chatId: UUID
    @Environment(ChatService.self) var chatService
    @State private var show = false
    @State var message = ""
    @Environment(\.dismiss) var dismiss

    var chat: Chat? {
        chatService.chats.first(where: { $0.id == chatId })
    }

    var body: some View {
        VStack {
            if let chat = chat {
                if chat.messages.isEmpty {
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.secondary)
                        .frame(width: 70, height: 70)
                    Text(chat.name)
                        .font(.headline.bold())
                    Text("No messages yet. Start the conversation!")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(chat.messages) { msg in
                                HStack {
                                    if msg.user {
                                        Spacer()
                                        Text(msg.text)
                                            .padding()
                                            .background(.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(20)
                                    } else {
                                        Text(msg.text)
                                            .padding()
                                            .background(Color(.systemGray5))
                                            .cornerRadius(20)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .padding(.top)
                    }
                }
            }


            HStack {
                TextField("Message", text: $message, axis: .vertical)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .lineLimit(3)

                if !message.isEmpty {
                    Button {
                        let userMessage = message
                        message = ""
                        Task {
                            await chatService.sendMessage(text: userMessage, chatId: chatId)
                        }
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(.blue)
                            .clipShape(Circle())
                    }
                }
            }
            .padding(.bottom, 5)
        }
        .padding(10)
        .navigationTitle(chat?.name ?? "Chat")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { show = true }) {
                    Image(systemName: "trash")
                        .foregroundStyle(Color.red)
                }
                .alert("Delete chat", isPresented: $show) {
                    Button("Delete", role: .destructive) {
                        if let chat = chat {
                            chatService.deleteChat(chat: chat)
                            dismiss()
                        }
                    }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Do you want to delete \(chat?.name ?? "this chat")?")
                }
            }
        }
    }
}
