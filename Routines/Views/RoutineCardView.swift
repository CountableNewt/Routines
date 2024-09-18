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
    var stepCount: Int {
        if routine.steps.count == 0 {
            return 0
        } else {
            var tempCount = 0
            for step in routine.steps {
                if step.isToday() {
                    tempCount += 1
                }
            }
            return tempCount
        }
    }
    
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
                Text("\(stepCount) step\(stepCount != 1 ? "s" : "") today")
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
