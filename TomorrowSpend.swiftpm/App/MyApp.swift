import SwiftUI

@main
struct MyApp: App {
    @StateObject var appState = AppState()
    
    init() {
        FontManager.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            InitView()
                .environmentObject(appState)
        }
    }
}
