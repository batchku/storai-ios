import Foundation

// Represents a complete generated story with its pages and metadata
struct Story: Identifiable, Hashable, Equatable {

    let id: UUID
    var title: String
    var pages: [StoryPage]
    var configuration: StoryConfiguration
    var shareUrl: String?
    
    // Represents a single page in the story with text and illustration
    struct StoryPage: Identifiable, Codable, Hashable, Equatable {
        let id: UUID
        var text: String           // Page text content
        var imageUrl: String?      // URL to page illustration
    }
    
    // Custom Equatable implementation to handle non-Equatable configuration
    static func == (lhs: Story, rhs: Story) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.pages == rhs.pages &&
            lhs.shareUrl == rhs.shareUrl
    }
    
    // Custom Hashable implementation to handle non-Hashable configuration
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(pages)
        hasher.combine(shareUrl)
    }
}
