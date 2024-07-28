//
//  RoutinesApp.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//

import SwiftUI
import SwiftData
import UserNotifications
import BackgroundTasks

@main
struct RoutinesApp: App {
    @Environment(\.scenePhase) private var scenePhase
    let taskIdentifier = "com.sam-clemente.routines-app.reset-routines"
    
    var body: some Scene {
        WindowGroup {
            RoutineListView()
                .onAppear(perform: promptForNotifications)
        }
        .modelContainer(for: Routine.self)
        .onChange(of: scenePhase) {
            switch scenePhase {
            case .background: scheduleAppRefresh()
            default: break
            }
        }
        .backgroundTask(.appRefresh(taskIdentifier)) {
            Routine.resetRoutines()
        }
    }
    
    private func promptForNotifications() {
        Task {
            let currentCenter = UNUserNotificationCenter.current()
            do {
                let _ = try await currentCenter.requestAuthorization(options: [.sound, .alert, .badge])
            } catch {
                print("Error handling notifications \(error.localizedDescription)")
            }
        }
    }
    
    private func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: taskIdentifier)
        do {
            try BGTaskScheduler.shared.submit(request)
            print("Task scheduled.")
        } catch {
            print("Could not schedule app refresh: \(error.localizedDescription)")
        }
    }
}
