import SwiftUI

struct InitView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Group {
            switch appState.flow {
            case .createTrip:
                CreateTripFlowView()
            case .main:
                MainView()
            }
        }
        .font(.aggro(.light, size: 17))
        .foregroundStyle(Color.appPrimary)
    }
}
