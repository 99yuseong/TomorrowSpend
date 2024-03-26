import SwiftUI

struct InitView: View {
    @EnvironmentObject var appState: AppState
    @State private var isSplashShowing: Bool = true
    
    var body: some View {
        if isSplashShowing {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isSplashShowing = false
                    }
                }
        } else {
            ZStack {
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
}
