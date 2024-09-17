//
//  EditRoutineView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct EditRoutineView: View {
    @Bindable var routine: Routine
    @State private var tempRoutine: Routine
    let circleButtonSize = 45.5
    var onDismiss: (Routine) -> Void
    var onSave: (Routine) -> Void
    
    init(routine: Routine, onDismiss: @escaping (Routine) -> Void, onSave: @escaping (Routine) -> Void) {
        self.routine = routine
        _tempRoutine = State(initialValue: routine.copy())
        self.onDismiss = onDismiss
        self.onSave = onSave
    }
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Routine Name", text: $tempRoutine.name)
            }
            Section("Time") {
                DatePicker("Routine Time", selection: $tempRoutine.time, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.compact)
                HStack {
                    Spacer()
                    EditDaysView(days: $tempRoutine.days)
                    Spacer()
                }
            }
            Section("Icon") {
                HStack {
                    Spacer()
                    Circle()
                        .fill(tempRoutine.getIconColor())
                        .frame(width: 80)
                        .overlay(
                            Image(systemName: tempRoutine.iconSymbol)
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        )
                    Spacer()
                }
                Text("Color")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(SystemColors.allCases, id: \.self) { color in
                            Button(action: {
                                tempRoutine.iconColor = color.rawValue
                            }) {
                                Circle()
                                    .fill(color.color)
                            }
                            .frame(width: circleButtonSize)
                        }
                    }
                }
                Text("Symbol")
                    .font(.headline)
                ForEach(IconLists.allCases, id: \.self) { list in
                    HStack {
                        Text(list.rawValue)
                            .font(.caption)
                            .frame(width: 1.5 * circleButtonSize, height: circleButtonSize, alignment: .leading)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(list.iconList, id: \.self) { icon in
                                    Button(action: {
                                        tempRoutine.iconSymbol = icon
                                    }) {
                                        Circle()
                                            .fill(.gray)
                                            .frame(width: circleButtonSize)
                                            .overlay(
                                                Image(systemName: icon)
                                                    .foregroundColor(.white)
                                            )
                                    }
                                }
                            }
                        }
                   }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: {
                    onDismiss(tempRoutine)
                }) {
                    Text("Cancel")
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
                    onSave(tempRoutine)
                }) {
                    Text("Done")
                }
            }
        }
    }
}
