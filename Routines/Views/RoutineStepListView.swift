//
//  RoutineStepListView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct RoutineStepListView: View {
    @Bindable var routine: Routine
    @State var editRoutineViewIsPresented = false
    @State var addStepViewIsPresented = false
    @State var newStepName = ""
    
    var body: some View {
        HStack {
            Image(systemName: "clock")
            Text(routine.getTime().formattedTime())
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
                            }
                            Text(step.name)
                        }
                    }
                    .onDelete(perform: deleteStep)
                    Button(action: addStep) {
                        HStack {
                            TextField("Quick Add Step", text: $newStepName)
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
                .navigationTitle(routine.name)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        // Share Sheet [To Be Implemented]
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            editRoutineViewIsPresented = true
                        }) {
                            Image(systemName: "ellipsis.circle")
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            addStepViewIsPresented = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
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
                        EditRoutineView(routine: routine, isPresented: $editRoutineViewIsPresented)
                            .navigationTitle("Edit Routine")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button(action: {
                                        editRoutineViewIsPresented = false
                                    }) {
                                        Text("Cancel")
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button(action: {
                                        editRoutineViewIsPresented = false
                                    }) {
                                        Text("Done")
                                    }
                                }
                            }
                        
                    }
                }
        }
    }
    
    func deleteStep(_ indexSet: IndexSet) {
        for index in indexSet {
            routine.steps.remove(at: index)
        }
    }
    
    private func addStep() {
        guard !newStepName.isEmpty else { return }
        
        withAnimation {
            let newStep = Step(name: newStepName)
            newStepName = ""
            routine.steps.append(newStep)
        }
    }
}

