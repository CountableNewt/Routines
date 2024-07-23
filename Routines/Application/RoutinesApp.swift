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
        DispatchQueue.main.async {
            UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge]) { success, error in
                if let error = error {
                    print("Error handling notifications \(error.localizedDescription)")
                }
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            RoutineListView()
//                .onAppear(perform: promptForNotifications)
        }
        .modelContainer(for: Routine.self)
    }
}
