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
                .onAppear {
                    DispatchQueue.global().async {
                        appState.countries = CountryManager.shared.loadCountryData()
                        print(CountryManager.shared.loadCountryData())
                    }
                }
        }
    }
}
