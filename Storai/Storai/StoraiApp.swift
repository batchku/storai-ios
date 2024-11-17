// Main entry point for the Storai application
// Configures the root view as StoryCreationView
import SwiftUI

@main
struct StoraiApp: App {
    var body: some Scene {
        WindowGroup {
            StoryCreationView()
        }
    }
}
