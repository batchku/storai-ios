import SwiftUI

// Main view for story creation wizard
// Manages a 5-step process for configuring story parameters
// Uses a step indicator and navigation controls for progression
struct StoryCreationView: View {
    @StateObject private var viewModel = StoryCreationViewModel()
    @State private var currentStep = 1
    
    var body: some View {
        NavigationView {
            VStack {
                StepIndicator(currentStep: currentStep)
                
                ScrollView {
                    switch currentStep {
                    case 1:
                        Picker("Story Type", selection: $viewModel.configuration.storyType) {
                            Text("Adventure").tag(StoryConfiguration.StoryType.adventure)
                            Text("Fantasy").tag(StoryConfiguration.StoryType.fantasy)
                            Text("Mystery").tag(StoryConfiguration.StoryType.mystery)
                            Text("Fairy Tale").tag(StoryConfiguration.StoryType.fairyTale)
                            Text("Science Fiction").tag(StoryConfiguration.StoryType.scienceFiction)
                        }
                        .pickerStyle(.wheel)
                        .padding()
                    case 2:
                        VStack {
                            TextField("Hero Name", text: $viewModel.configuration.heroName)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                            
                            Picker("Hero Type", selection: $viewModel.configuration.heroType) {
                                ForEach(StoryConfiguration.HeroType.allCases, id: \.self) { type in
                                    Text(type.rawValue.capitalized).tag(type)
                                }
                            }
                            .pickerStyle(.wheel)
                            .padding()
                        }
                    case 3:
                        VStack {
                            TextField("Subject", text: $viewModel.configuration.subject)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                            
                            TextField("Setting", text: $viewModel.configuration.setting)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                        }
                    case 4:
                        VStack {
                            Picker("Art Style", selection: $viewModel.configuration.imageStyle) {
                                Text("Realistic").tag(StoryConfiguration.ImageStyle.realistic)
                                Text("Cartoon").tag(StoryConfiguration.ImageStyle.cartoon)
                                Text("Watercolor").tag(StoryConfiguration.ImageStyle.watercolor)
                                Text("Digital Art").tag(StoryConfiguration.ImageStyle.digitalArt)
                                Text("Pixel Art").tag(StoryConfiguration.ImageStyle.pixelArt)
                            }
                            .pickerStyle(.wheel)
                            .padding()
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(viewModel.configuration.customImageUrls ?? [], id: \.self) { url in
                                        AsyncImage(url: URL(string: url)) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 100)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                    case 5:
                        VStack {
                            Picker("Writing Style", selection: $viewModel.configuration.writingStyle) {
                                Text("Casual").tag(StoryConfiguration.WritingStyle.casual)
                                Text("Professional").tag(StoryConfiguration.WritingStyle.professional)
                                Text("Poetic").tag(StoryConfiguration.WritingStyle.poetic)
                                Text("Humorous").tag(StoryConfiguration.WritingStyle.humorous)
                            }
                            .pickerStyle(.wheel)
                            .padding()
                        }
                    default:
                        EmptyView()
                    }
                }
                .padding()
                
                NavigationControls(
                    currentStep: $currentStep,
                    maxSteps: 5,
                    onComplete: viewModel.generateStory
                )
            }
            .navigationTitle("Create a Story")
        }
    }
}

struct StepIndicator: View {
    let currentStep: Int
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach(1...5, id: \.self) { step in
                Circle()
                    .fill(step <= currentStep ? Color.blue : Color.gray)
                    .frame(width: 10, height: 10)
            }
        }
        .padding()
    }
}

struct NavigationControls: View {
    @Binding var currentStep: Int
    let maxSteps: Int
    let onComplete: () -> Void
    
    var body: some View {
        HStack {
            if currentStep > 1 {
                Button("Back") {
                    currentStep -= 1
                }
            }
            
            Spacer()
            
            if currentStep < maxSteps {
                Button("Next") {
                    currentStep += 1
                }
            } else {
                Button("Create Story") {
                    onComplete()
                }
            }
        }
        .padding()
    }
} 