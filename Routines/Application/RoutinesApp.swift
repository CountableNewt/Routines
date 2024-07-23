//
//  RoutinesApp.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//

import SwiftUI
import SwiftData
import UserNotifications

@main
struct RoutinesApp: App {
    func promptForNotifications() {
        Task {
            let currentCenter = UNUserNotificationCenter.current()
            do {
                let _ = try await currentCenter.requestAuthorization(options: [.sound, .alert, .badge])
            } catch {
                print("Error handling notifications \(error.localizedDescription)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            RoutineListView()
                .onAppear(perform: promptForNotifications)
        }
        .modelContainer(for: Routine.self)
    }
}
