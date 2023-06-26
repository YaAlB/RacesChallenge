// Model

import SwiftUI

struct RaceDataInfo: Codable {
    let raceSummaries: [RaceSummary]
}

struct RaceSummary: Codable, Identifiable {
    var id = UUID()
    let raceId: String
    let raceNumber: Int
    let meetingName: String
    let categoryId: String
    var advertisedStart: AdvertisedStart?
}

struct AdvertisedStart: Codable {
    var seconds: Int

    var hours: Int {
        return seconds / 3600
    }

    var minutes: Int {
        return (seconds % 3600) / 60
    }

    var remainingSeconds: Int {
        return (seconds % 3600) % 60
    }
}
