//
//  MemoAI_App.swift
//  Memo AI
//
//  Copyright 2025 Memo AI. All rights reserved.
//

import SwiftUI
import UserNotifications

@main
struct MemoAI_App: App {
    init() {
        // Request notification authorization asynchronously
        Task.init {
            do {
                let options: UNAuthorizationOptions = [.alert, .sound, .badge]
                let granted = try await UNUserNotificationCenter.current().requestAuthorization(options: options)
                print("Notification authorization status: \(granted)")
            } catch {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
        }
    }
}
