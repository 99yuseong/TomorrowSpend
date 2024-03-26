//
//  AppFlow.swift
//
//
//  Created by 남유성 on 3/22/24.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var flow: Flow = .createTrip
}

// MARK: - Flow
extension AppState {
    enum Flow {
        case createTrip
        case main
    }
    
    public func flow(to flow: Flow) {
        withAnimation {
            self.flow = flow
        }
    }
}
