import SwiftUI

// ViewModel for managing story creation state and business logic
class StoryCreationViewModel: ObservableObject {
    // Published configuration that updates the UI when changed
    @Published var configuration = StoryConfiguration(
        storyType: .adventure,
        heroCharacter: "",
        subject: "",
        setting: "",
        imageStyle: .cartoon,
        customImageUrls: nil,
        writingStyle: .casual
    )
    
    // Handles story generation when user completes configuration
    func generateStory() {
        // TODO: Implement story generation logic
        print("Generating story with configuration:", configuration)
    }
} 