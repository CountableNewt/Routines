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
    @Query(sort: [SortDescriptor(\Routine.routineStartHour, order: .forward)]) private var routines: [Routine]
    @State var addRoutineIsPresented = false
    @State var donationIsPresented = false

    var body: some View {
        NavigationStack {
            List(routines) { routine in
                NavigationLink(destination: RoutineStepListView(routine: routine)) {
                    RoutineCardView(routine: routine)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        donationIsPresented = true
                    }) {
                        Image(systemName: "heart.circle")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        addRoutineIsPresented = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("Routines")
            .sheet(isPresented: $addRoutineIsPresented) {
                NavigationStack {
                    AddRoutineView(isPresented: $addRoutineIsPresented)
                        .navigationTitle("Add Routine")
                        .navigationBarTitleDisplayMode(.inline)
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button(action: {
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
            .sheet(isPresented: $donationIsPresented) {
                NavigationStack {
                    DonationView(isPresented: $donationIsPresented)
                        .navigationTitle("Donate")
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button(action: {
                                    donationIsPresented = false
                                }) {
                                    Text("Cancel")
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button(action: {
                                    donationIsPresented = false
                                }) {
                                    Text("Done")
                                }
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    RoutineListView()
        .modelContainer(previewContainer)
}
