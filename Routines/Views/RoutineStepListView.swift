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
        NavigationStack {
                List {
                    ForEach(routine.steps) { step in
                        Text(step.name)
                    }
                    .onDelete(perform: deleteStep)
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
            routine.steps.append(newStep)
            newStepName = ""
        }
    }
}

#Preview {
    RoutineStepListView(routine: SampleRoutines.routines[0])
}
