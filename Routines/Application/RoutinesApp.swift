//
//  RoutinesApp.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//

import SwiftUI
import SwiftData
import UserNotifications
import TipKit

@main
struct RoutinesApp: App {
    var resetTipsOnLaunch: Bool = true
    
    init() {
        configureTips()
    }
    
    var body: some Scene {
        WindowGroup {
            RoutineListView()
                .onAppear(perform: promptForNotifications)
        }
        .modelContainer(for: Routine.self)
    }

    private func promptForNotifications() {
        Task {
            let currentCenter = UNUserNotificationCenter.current()
            do {
                let _ = try await currentCenter.requestAuthorization(options: [.sound, .alert, .badge])
                print("Notifications Requested")
            } catch {
                print("Error handling notifications \(error.localizedDescription)")
            }
        }
    }
    
    private func configureTips() {
        Task {
            do {
                if resetTipsOnLaunch {
                    try Tips.resetDatastore()
                    print("Resetting Tips")
                }
                try Tips.configure([
                    .displayFrequency(.immediate),
                    .datastoreLocation(.applicationDefault)
                ])
                print("Configured Tips")
            } catch {
                print("Error initializing TipKit: \(error.localizedDescription)")
            }
        }
    }
}
