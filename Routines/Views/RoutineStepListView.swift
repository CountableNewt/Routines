//
//  RoutineStepListView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct RoutineStepListView: View {
    var routine: Routine
    @State var editRoutineViewIsPresented = false
    @State var addStepViewIsPresented = false
    
    var body: some View {
        NavigationStack {
            List(routine.steps) { step in
                Text(step.name)
            }
        }
        .navigationTitle(routine.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                
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
                AddStepView(isPresented: $addStepViewIsPresented)
                    .navigationTitle("Add Step")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button(action: {
                                addStepViewIsPresented = false
                            }) {
                                Text("Cancel")
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button(action: {
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
                EditRoutineView(isPresented: $editRoutineViewIsPresented)
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
        }   }
}

#Preview {
    RoutineStepListView(routine: SampleRoutines.routines[0])
}
