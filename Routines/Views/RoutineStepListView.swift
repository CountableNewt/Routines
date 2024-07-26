//
//  RoutineStepListView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct RoutineStepListView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var routine: Routine
    @State private var editRoutineViewIsPresented = false
    @State private var addStepViewIsPresented = false
    @State private var newStepName = ""
    
    var body: some View {
        HStack {
            Image(systemName: "clock")
            Text(routine.timeToString())
            Spacer()
        }
        .padding(.leading)
        NavigationStack {
                List {
                    ForEach(routine.steps) { step in
                        HStack {
                            Button(action: { step.isComplete.toggle() }) {
                                let systemName = step.isComplete ? "checkmark.circle.fill" : "circle"
                                Image(systemName: systemName)
                                    .foregroundStyle(routine.getIconColor())
                            }
                            Text(step.name)
                        }
                    }
                    .onDelete(perform: deleteStep)
                    Button(action: addStep) {
                        HStack {
                            TextField("Quick Add", text: $newStepName)
                                .onSubmit(addStep)
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(routine.getIconColor())
                        }
                    }
                }
                .navigationTitle(routine.name)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        // Share Sheet [To Be Implemented]
                        Button(action: routine.resetSteps) {
                            Text("Reset Steps")
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            editRoutineViewIsPresented = true
                        }) {
                            Image(systemName: "pencil")
                        }
                    }
//                    ToolbarItem(placement: .topBarTrailing) {
//                        Button(action: {
//                            addStepViewIsPresented = true
//                        }) {
//                            Image(systemName: "plus")
//                        }
//                    }
                }
                .sheet(isPresented: $addStepViewIsPresented) {
                    NavigationStack {
                        AddStepView(newStep: $newStepName, isPresented: $addStepViewIsPresented)
                            .navigationTitle("Add Step")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button(action: {
                                        addStepViewIsPresented = false
                                        newStepName = ""
                                    }) {
                                        Text("Cancel")
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button(action: {
                                        addStep()
                                        addStepViewIsPresented = false
                                    }) {
                                        Text("Done")
                                    }
                                }
                            }
                    }
                }
                .sheet(isPresented: $editRoutineViewIsPresented) {
                    NavigationStack {
                        EditRoutineView(routine: routine, onDismiss: { tempRoutine in
                            modelContext.delete(tempRoutine)
                            editRoutineViewIsPresented = false
                        }, onSave: { tempRoutine in
                            routine.name = tempRoutine.name
                            routine.time = tempRoutine.time
                            routine.iconSymbol = tempRoutine.iconSymbol
                            routine.iconColor = tempRoutine.iconColor
                            modelContext.delete(tempRoutine)
                            editRoutineViewIsPresented = false
                        })
                            .navigationTitle("Edit Routine")
                    }
                }
        }
    }
    
    func deleteStep(_ indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(routine.steps[index])
            routine.steps.remove(at: index)
        }
    }
    
    private func addStep() {
        guard !newStepName.isEmpty else { return }
        
        withAnimation {
            let newStep = Step(name: newStepName)
            newStepName = ""
            modelContext.insert(newStep)
            routine.steps.append(newStep)
        }
    }
}

