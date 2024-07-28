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
    let taskIdentifier = "com.sam-clemente.routines-app.reset-routines"
    
    init() {
        registerBackgroundTasks()
        print("Application Initialized")
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
    
    var body: some Scene {
        WindowGroup {
            RoutineListView()
                .onAppear(perform: promptForNotifications)
        }
        .modelContainer(for: Routine.self)
    }
    
    private func registerBackgroundTasks() {
        print("Registering Background Tasks")
        BGTaskScheduler.shared.register(forTaskWithIdentifier: taskIdentifier, using: nil) { task in
            self.handleAppRefresh(task: task as! BGAppRefreshTask)
            print("Background Task \(taskIdentifier) Registered")
        }
    }
    
    private func handleAppRefresh(task: BGAppRefreshTask) {
        print("Handling App Refresh")
        scheduleAppRefresh()
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        let _ = BackgroundOperation()
        task.expirationHandler = {
            queue.cancelAllOperations()
        }
    }
    
    private func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: taskIdentifier)
        request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60)
        do {
            try BGTaskScheduler.shared.submit(request)
            print("Task scheduled for 15 minutes from now.")
        } catch {
            print("Could not schedule app refresh: \(error.localizedDescription)")
        }
    }
}
