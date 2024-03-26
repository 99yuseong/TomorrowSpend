import SwiftUI

@main
struct MyApp: App {
    @StateObject var appState = AppState()
    @StateObject var tripData = TripModel()
    
    init() {
        FontManager.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            InitView()
                .environmentObject(appState)
                .environmentObject(tripData)
                .onAppear {
                    // TODO: - 처음 Trip 설정된 이후, 앱킬때마다, updateCurrency
                }
        }
    }
}
