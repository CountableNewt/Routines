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
    @Binding var isPresented: Bool
    @State var routineTime = Date()
    let circleButtonSize = 45.5
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Routine Name", text: $routine.name)
            }
            Section("Time") {
                DatePicker("Routine Time", selection: $routineTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.compact)
                    .onSubmit {
                        routine.startHour = Calendar.current.component(.hour, from: routineTime)
                        routine.startMinute = Calendar.current.component(.minute, from: routineTime)
                    }
            }
            Section("Icon") {
                HStack {
                    Spacer()
                    Circle()
                        .fill(routine.getIconColor())
                        .frame(width: 80)
                        .overlay(
                            Image(systemName: routine.iconSymbol)
                                .font(.largeTitle)
                        )
                    Spacer()
                }
                Text("Color")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(SystemColors.allCases, id: \.self) { color in
                            Button(action: {
                                routine.iconColor = color.rawValue
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
                    Text(list.rawValue)
                        .font(.caption)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(list.iconList, id: \.self) { icon in
                                Button(action: {
                                    routine.iconSymbol = icon
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
}
