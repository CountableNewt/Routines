//
//  RoutinesApp.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//

import SwiftUI
import SwiftData

@main
struct RoutinesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RoutineListView()
        }
        .modelContainer(for: Routine.self)
    }
    
}
