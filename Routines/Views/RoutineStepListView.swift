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
    @State private var editingStepIndex: Int? = nil
    @State private var updatedStepName: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "clock")
            Text(routine.timeToString())
            Spacer()
        }
        .padding(.leading)
        NavigationStack {
                List {
                    ForEach(routine.steps.sorted(by: { $0.order < $1.order }), id: \.id) { step in
                        HStack {
                            Button(action: {
                                if step.status != .complete {
                                    step.status = .complete
                                } else {
                                    step.status = .incomplete
                                }
                                routine.checkRoutineCompletion()
                            }) {
                                Image(systemName: step.status.icon)
                                    .foregroundStyle(routine.getIconColor())
                                    .contentShape(Rectangle())
                            }
                            .buttonStyle(PlainButtonStyle())
                            .simultaneousGesture(
                                LongPressGesture()
                                    .onEnded {_ in
                                        if step.status != .skipped {
                                            step.status = .skipped
                                        } else {
                                            step.status = .incomplete
                                        }
                                        routine.checkRoutineCompletion()
                                    }
                            )
                            if editingStepIndex == step.order {
                                TextField(step.name, text: $updatedStepName)
                                    .onSubmit {
                                        guard updatedStepName.isEmpty else {
                                            step.name = updatedStepName
                                            return
                                        }
                                        editingStepIndex = nil
                                        save()
                                    }
                            } else {
                                Text(step.name)
                                    .onTapGesture {
                                        updatedStepName = step.name
                                        editingStepIndex = step.order
                                    }
                            }
                        }
                    }
                    .onMove(perform: moveItem)
                    .onDelete(perform: deleteStep)
                    Button(action: addStep) {
                        HStack {
                            TextField("Quick Add", text: $newStepName)
                                .onSubmit {
                                    addStep()
                                }
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(routine.getIconColor())
                                .onTapGesture {
                                    addStep()
                                }
                        }
                    }
                }
                .navigationTitle(routine.name)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        // Share Sheet [To Be Implemented]
//                        Button(action: routine.resetSteps) {
//                            Text("Reset Steps")
//                        }
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
        var tempSteps = routine.steps
        tempSteps = tempSteps.sorted(by: { $0.order < $1.order })
        
        for index in indexSet.map({ $0 }) {
            print("Deleting \(tempSteps[index].name) from position \(tempSteps[index].order)")
            tempSteps.remove(at: index)
        }
        
        for (index, step) in tempSteps.enumerated() {
            step.order = index
        }
        
        routine.steps = tempSteps
        save()
        routine.checkRoutineCompletion()
    }
    
    private func addStep() {
        guard !newStepName.isEmpty else { return }
        
        withAnimation {
            let newStep = Step(name: newStepName, routine: routine, order: routine.steps.count)
            print("Adding Step: \(newStep.name) to position: \(newStep.order)")
            newStepName = ""
            modelContext.insert(newStep)
            routine.steps.append(newStep)
        }
        save()
        routine.checkRoutineCompletion()
    }
    
    private func moveItem(from source: IndexSet, to destination: Int) {
        var tempSteps = routine.steps
        tempSteps = tempSteps.sorted(by: { $0.order < $1.order })
        tempSteps.move(fromOffsets: source, toOffset: destination)
        
        for (index, step) in tempSteps.enumerated() {
            step.order = index
        }
        
        routine.steps = tempSteps
        save()
        
        for step in routine.steps.sorted(by: {$0.order < $1.order }) {
            print("Step \"\(step.name)\" is at index: \(step.order)")
        }
        print("----------------------------")
    }
    
    private func save() {
        do {
            try modelContext.save()
        } catch {
            print("Error Saving: \(error.localizedDescription)")
        }
    }
}

