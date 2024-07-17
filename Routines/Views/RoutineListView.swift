//
//  RoutineListView.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//

import SwiftUI
import SwiftData

struct RoutineListView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Routine.time, order: .forward)]) var routines: [Routine]
    @State var addRoutineIsPresented = false
    @State var settingsIsPresented = false
    @State var newRoutine: Routine?

    var body: some View {
        NavigationStack {
            List {
                ForEach(routines) { routine in
                    NavigationLink(destination: RoutineStepListView(routine: routine)) {
                        RoutineCardView(routine: routine)
                    }
                }
                .onDelete(perform: deleteRoutine)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Donate", systemImage: "gear", action: {
                        settingsIsPresented = true
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Routine", systemImage: "plus", action: {
                        addRoutine()
                    })
                }
            }
            .navigationTitle("Routines")
            .sheet(isPresented: $settingsIsPresented) {
                NavigationStack {
                    SettingsView(isPresented: $settingsIsPresented)
                        .navigationTitle("Settings")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button(action: {
                                    settingsIsPresented = false
                                }) {
                                    Text("Cancel")
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button(action: {
                                    settingsIsPresented = false
                                }) {
                                    Text("Done")
                                }
                            }
                        }
                }
            }
            .sheet(isPresented: $addRoutineIsPresented) {
                NavigationStack {
                    EditRoutineView(routine: newRoutine ?? Routine(), onDismiss: { tempRoutine in
                        modelContext.delete(newRoutine ?? Routine())
                        addRoutineIsPresented = false
                    }, onSave: { tempRoutine in
                        if let routine = newRoutine {
                            routine.name = tempRoutine.name
                            routine.time = tempRoutine.time
                            routine.iconSymbol = tempRoutine.iconSymbol
                            routine.iconColor = tempRoutine.iconColor
                        }
                        addRoutineIsPresented = false
                    })
                        .navigationTitle("New Routine")
                }
            }
        }
    }
    
    func addRoutine() {
        let routine = Routine()
        modelContext.insert(routine)
        newRoutine = routine
        addRoutineIsPresented = true
    }
    
    func deleteRoutine(_ indexSet: IndexSet) {
        for index in indexSet {
            let routine = routines[index]
            modelContext.delete(routine)
        }
    }
}
