//
//  ContentView.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//

import SwiftUI
import SwiftData

struct RoutineListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var routines: [Routine]

    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    RoutineListView()
        .modelContainer(previewContainer)
}
