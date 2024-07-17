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
                        Spacer()
                    }
                }
            }
            HStack {
                Image(systemName: "list.bullet")
                Text("\(routine.steps.count) steps")
                Spacer()
                Text("\(routine.getTime().formattedTime())")
                Image(systemName: "clock")
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

#Preview {
    RoutineCardView(routine: SampleRoutines.routines[0])
}
