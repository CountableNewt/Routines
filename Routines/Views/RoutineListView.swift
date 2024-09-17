//
//  RoutineListView.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//

import SwiftUI
import SwiftData
import TipKit

struct RoutineListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var routines: [Routine]
    @State var addRoutineIsPresented = false
    @State var settingsIsPresented = false
    @State var newRoutine: Routine?
    @State var resetAlertIsPresented = false
    @State var showAllRoutines = false
    @State var routinesAreHidden = false
    
    let resetRoutinesTip = ResetRoutinesTip()
    var today: String {
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "EEEE"
        
        return formatter.string(from: date)
    }

    var body: some View {
        NavigationStack {
            Group {
                if routines.isEmpty {
                    Text("No Routines")
                        .foregroundStyle(.secondary)
                } else {
                    List {
                        ForEach(routines.sorted(by: { getTimeComponent($0.time) < getTimeComponent($1.time) }), id: \.id) { routine in
                            if routine.isToday() || showAllRoutines {
                                NavigationLink(destination: RoutineStepListView(routine: routine)) {
                                    RoutineCardView(routine: routine)
                                }
                            }
                        }
                        .onDelete(perform: deleteRoutine)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Show All Routines", systemImage: showAllRoutines ? "eye" : "eye.slash") {
                        showAllRoutines.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Donate", systemImage: "gear", action: { settingsIsPresented = true })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Reset Routines", systemImage: "arrow.circlepath", action: { resetAlertIsPresented = true })
                        .popoverTip(resetRoutinesTip)
                        .onTapGesture {
                            resetRoutinesTip.invalidate(reason: .actionPerformed)
                        }
                        .alert("Reset Routines to Incomplete?", isPresented: $resetAlertIsPresented) {
                            Button("Reset", role: .destructive, action: resetRoutines)
                            Button("Cancel", role: .cancel, action: { resetAlertIsPresented = false })
                        }
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
                            routine.days = tempRoutine.days
                        }
                        addRoutineIsPresented = false
                    })
                        .navigationTitle("New Routine")
                }
            }
        }
    }
    
    private func getTimeComponent(_ date: Date) -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: date)
        return calendar.date(from: components) ?? date
    }
    
    private func resetRoutines() {
        for routine in routines {
            routine.resetSteps()
        }
    }
    
    private func addRoutine() {
        addRoutineIsPresented = true
        let routine = Routine()
        modelContext.insert(routine)
        newRoutine = routine
    }
    
    private func deleteRoutine(_ indexSet: IndexSet) {
        for index in indexSet {
            let routine = routines[index]
            modelContext.delete(routine)
        }
    }
}
