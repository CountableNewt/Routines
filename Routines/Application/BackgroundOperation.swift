//
//  BackgroundOperation.swift
//  Routines
//
//  Created by Sam Clemente on 7/26/24.
//

import Foundation

class BackgroundOperation: Operation, @unchecked Sendable {

    override func main() {
        if isCancelled { return }
        Routine.resetRoutines()
    }
}
