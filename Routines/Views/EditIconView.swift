//
//  IconColorPickerView.swift
//  Routines
//
//  Created by Sam Clemente on 7/9/24.
//

import SwiftUI

struct EditIconView: View {
    @Bindable var routine: Routine
    let circleButtonSize = 45.5
    
    var body: some View {
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
                        .frame(width: circleButtonSize)
                    }
                }
            }
        }
    }
}

#Preview {
    EditIconView(routine: SampleRoutines.routines[0])
}
