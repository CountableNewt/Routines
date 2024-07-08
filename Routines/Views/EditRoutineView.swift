//
//  EditRoutineView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct EditRoutineView: View {
    var routine: Routine
    @Binding var isPresented: Bool
    @State private var routineName: String
    let circleButtonSize = 45.5
    
    init(routine: Routine, isPresented: Binding<Bool>) {
        self.routine = routine
        self._isPresented = isPresented
        self._routineName = State(initialValue: routine.name)
    }
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Name", text: $routineName)
            }
            Section("Routine Time") {
                Text("Time Picker [To Be Implemented]")
                // DatePicker("Routine Time", selection: <#T##Binding<Date>#>)
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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(SystemColors.allCases, id: \.self) { color in
                            Button(action: {
                                routine.iconColor = color.rawValue
                            }) {
                                Circle()
                                    .fill(color.color)
                            }
                            .frame(width: 45)
                        }
                    }
                }
                VStack {
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                    HStack {
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                        Circle()
                            .fill(.gray)
                            .overlay(Image(systemName: "list.bullet"))
                    }
                }
                
            }
        }
    }
}

#Preview {
    EditRoutineView(routine: SampleRoutines.routines[0], isPresented: .constant(true))
}
