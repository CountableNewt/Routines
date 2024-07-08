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
    
    var body: some Scene {
        WindowGroup {
            RoutineListView()
        }
        .modelContainer(for: Step.self)
        .modelContainer(for: Routine.self)
    }
}
