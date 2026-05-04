//
//  ChatService.swift
//  IAGlobantChat
//
//  Created by Irene Canada Gomez on 14/04/2026.
//

import Foundation
import FoundationModels

@MainActor
@Observable class ChatService {

    private let userDefaults: UserDefaults
    var chats: [Chat] = []
    private let session: LanguageModelSession
    let instructions = """
    You are a conversational AI assistant.
    
    Act like a smart, reliable, and helpful assistant in a chat interface.
    You should:
    - Understand the user's intent.
    - Answer in a natural, human-like way.
    - Be concise for simple questions.
    - Be detailed for complex or important questions.
    - Admit uncertainty instead of guessing.
    - Organize explanations clearly.
    - Offer examples, summaries, or next steps when helpful.
    - Maintain a calm, professional, friendly tone.
    - Adapt to the user's language and technical level.
    """

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        self.session = LanguageModelSession(instructions: instructions)
        restoreChats()

    }

    func storeChats() {
        if let data = try? JSONEncoder().encode(chats) {
            userDefaults.set(data, forKey: "chats")
        }
    }


    func getChats() -> [Chat] {
        if let data = userDefaults.data(forKey: "chats") {
            let chats = try? JSONDecoder().decode([Chat].self, from: data)
            return chats ?? []
        }
        return []
    }


    func restoreChats() {
        chats = getChats()
    }

    func hasChats() -> Bool {
        if chats.isEmpty{
            return false
        } else {
            return true
        }
    }

    func addChats(chatName: String) {
        let chat = Chat(id: UUID(), name: chatName, date: Date(), messages: [])
        chats.append(chat)
        storeChats()
    }

    func totalChats() -> Int {
        return chats.count
    }

    func deleteChats() {
        chats.removeAll()
        userDefaults.removeObject(forKey: "chats")
    }

    func deleteChat(chat : Chat) {
        chats.removeAll(where: { $0.id == chat.id })
        storeChats()
    }



    func sendMessage(text: String, chatId: UUID) async {
        guard let index = chats.firstIndex(where: { $0.id == chatId }) else { return }

        let userPrompt = Message(id: UUID(), text: text, user: true)
        chats[index].messages.append(userPrompt)

        do {

            let model = SystemLanguageModel.default
            switch model.availability {
            case .available:
                let response = try await session.respond(to: text)

                let botMessage = Message(id: UUID(), text: response.content, user: false)
                chats[index].messages.append(botMessage)
                storeChats()

            case .unavailable(.appleIntelligenceNotEnabled):
                print("Apple Intelligence is not enabled")
            case .unavailable(.modelNotReady):
                print("Model not ready yet")
            default:
                print("Model unavailable on this device")
            }

        } catch {
            print(error)
            let errorMsg = Message(id: UUID(), text: error.localizedDescription, user: false)
            chats[index].messages.append(errorMsg)
        }
    }



}
