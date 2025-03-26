//
//  HarkAI_App.swift
//  Hark AI
//
//  Copyright 2025 Hark AI. All rights reserved.
//

import SwiftUI
import UserNotifications

@main
struct HarkAI_App: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var reminderService = ReminderService()
    
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
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(reminderService)
        }
    }
}
