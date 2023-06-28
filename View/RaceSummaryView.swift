// View

import SwiftUI

struct RaceSummaryView: View {
    let summary: RaceSummary
    
    var body: some View {
        if let advertisedStart = summary.advertisedStart {
            HStack {
                categoryIcon(for: summary.categoryId)
                    .resizable()
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading) {
                    Text("Race Number: \(summary.raceNumber)")
                        .font(.headline)
                    Text("Meeting Name: \(summary.meetingName)")
                    Text("Advertised Start: \(advertisedStart.hours)h \(advertisedStart.minutes)m \(advertisedStart.remainingSeconds)s")
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
    }
    
    // Get the appropriate icon for the category
    private func categoryIcon(for categoryId: String) -> Image {
        let systemImageName: String
        
        switch categoryId {
        case "4a2788f8-e825-4d36-9894-efd4baf1cfae":
            systemImageName = "horse"
        case "161d9be2-e909-4326-8c2c-35ed71fb460b":
            systemImageName = "harness"
        case "9daef0d7-bf3c-4f50-921d-8e818c60fe61":
            systemImageName = "greyhound"
        default:
            systemImageName = "questionmark"
        }
        
        return Image(systemImageName)
    }
}
