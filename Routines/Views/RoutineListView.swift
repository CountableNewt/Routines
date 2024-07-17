//
//  ContentView.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//

import SwiftUI
import SwiftData

struct RoutineListView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Routine.startHour, order: .forward)]) var routines: [Routine]
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
                    EditRoutineView(routine: newRoutine ?? Routine(), isPresented: $addRoutineIsPresented)
                        .navigationTitle("New Routine")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button(action: {
                                    modelContext.delete(newRoutine ?? Routine())
                                    addRoutineIsPresented = false
                                }) {
                                    Text("Cancel")
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button(action: {
                                    addRoutineIsPresented = false
                                }) {
                                    Text("Done")
                                }
                            }
                        }
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

#Preview {
    RoutineListView()
        .modelContainer(previewContainer)
}
