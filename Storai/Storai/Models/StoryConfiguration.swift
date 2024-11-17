// Defines the configuration options for story generation
struct StoryConfiguration: Codable, Hashable {
    // Available story genres/types
    enum StoryType: String, CaseIterable, Codable {
        case adventure = "adventure"
        case fantasy = "fantasy"
        case mystery = "mystery"
        case fairyTale = "fairytale"
        case scienceFiction = "scifi"
    }
    
    // Available art styles for story illustrations
    enum ImageStyle: String, CaseIterable, Codable {
        case realistic = "realistic"
        case cartoon = "cartoon"
        case watercolor = "watercolor"
        case digitalArt = "digital"
        case pixelArt = "pixel"
    }
    
    // Available writing styles for story text
    enum WritingStyle: String, CaseIterable, Codable {
        case casual = "casual"
        case professional = "professional"
        case poetic = "poetic"
        case humorous = "humorous"
    }
    
    // Story configuration properties
    var storyType: StoryType
    var heroCharacter: String        // Name/description of main character
    var subject: String             // Main theme or subject of the story
    var setting: String            // Where the story takes place
    var imageStyle: ImageStyle     // Visual style for illustrations
    var customImageUrls: [String]? // Optional reference images for style
    var writingStyle: WritingStyle // Tone and style of writing
} 