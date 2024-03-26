import SwiftUI

@main
struct MyApp: App {
    @StateObject var appState = AppState()
    @StateObject var tripData = TripData()
    
    init() {
        FontManager.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            InitView()
                .environmentObject(appState)
                .environmentObject(tripData)
        }
    }
}
