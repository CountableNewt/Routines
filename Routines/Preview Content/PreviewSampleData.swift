//
//  PreviewSampleData.swift
//  Routines
//
//  Created by Sam Clemente on 7/1/24.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Routine.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<Routine>()).isEmpty {
            SampleRoutines.routines.forEach { container.mainContext.insert($0) }
            try modelContext.save()
        }
        return container
    } catch {
        fatalError("Failed to create container: \(error)")
    }
}()
