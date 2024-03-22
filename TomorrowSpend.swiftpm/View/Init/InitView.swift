import SwiftUI

struct InitView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        switch appState.flow {
        case .createTrip:
            CreateTripFlowView()
        case .main:
            MainView()
        }
    }
}
