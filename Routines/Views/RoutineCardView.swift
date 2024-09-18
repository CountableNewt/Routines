//
//  RoutineCardView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct RoutineCardView: View {
    var routine: Routine
    
    var body: some View {
        VStack {
            HStack{
                VStack {
                    HStack {
                        RoutineIconView(routine: routine)
                        Spacer()
                    }
                    HStack {
                        Text(routine.name)
                            .font(.headline)
                        if routine.steps.count > 0 {
                            Image(systemName: "checkmark.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(routine.status.icon.iconColor2 ?? routine.status.icon.iconColor1, routine.status.icon.iconColor1)
                        }
                        Spacer()
                    }
                }
            }
            HStack {
                Image(systemName: "list.bullet")
                Text("\(routine.steps.count) steps")
                Spacer()
                Text("\(routine.timeToString())")
                Image(systemName: "clock")
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

//#Preview {
//    RoutineCardView(routine: Routine())
//}
